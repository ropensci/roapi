require 'rubygems'
require 'sinatra'
require 'json'
require 'pg'
# require 'octokit'
# require 'coveralls'
# require 'travis'
require "rufus/scheduler"
require "sinatra/multi_route"

class ROApp < Sinatra::Application
  register Sinatra::MultiRoute

  # Set up PostgreSQL
  $client = PG.connect( dbname: 'roregistry' )

  # before do
  #   puts '[Params]'
  #   p params
  # end

  ## configuration
  configure do
    set :raise_errors, false
    set :show_exceptions, false
  end

  not_found do
    halt 404, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'route not found' })
  end

  error 500 do
    halt 500, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'server error' })
  end

  before do
    headers "Content-Type" => "application/json; charset=utf8"
    headers "Access-Control-Allow-Methods" => "HEAD, GET"
    headers "Access-Control-Allow-Origin" => "*"
    cache_control :public, :must_revalidate, :max_age => 60
  end

  ## routes
  get '/' do
    redirect '/heartbeat'
  end

  get '/docs' do
    redirect 'http://docs.fishbaseapi.apiary.io'
  end

  get "/heartbeat/?" do
    $ip = request.ip
    return JSON.pretty_generate({
      "routes" => [
        "/docs (GET)",
        "/heartbeat (GET)",
        "/repos (GET)",
        "/repos/:repo_name: (GET) (POST, PUT, DELETE [auth])"
      ]
    })
  end

  get '/repos/?:name?/?' do
    get_repo()
  end

  # auth required for post, put, delete
  post '/repos/:name/?' do
    add_repo()
  end

  put '/repos/:name/?' do
    edit_repo()
  end

  delete '/repos/:name/?' do
    delete_repo()
  end

  ## prevent some HTTP methods
  route :copy, :options, :trace, '/*' do
    halt 405
  end

  ## helper functions
  def get_repo
    name = params[:name]
    fields = params[:fields] || '*'
    params.delete("fields")
    fields = check_fields(fields)

    if name.nil?
      query = sprintf("SELECT %s FROM repos", fields)
    else
      query = sprintf("SELECT %s FROM repos WHERE name = '%s'", fields, name)
    end
    return do_query(query)
  end

  def add_repo
    store = {"POST" => "coming soon"}
    return JSON.generate(store)
  end

  def edit_repo
    store = {"PUT" => "coming soon"}
    return JSON.generate(store)
  end

  def delete_repo
    store = {"DELETE" => "coming soon"}
    return JSON.generate(store)
  end

  def check_fields(fields)
    query = sprintf("SELECT * FROM repos limit 1")
    res = $client.exec(query)
    flexist = res.fields
    fields = fields.split(',')
    if fields.length == 1
      fields = fields[0]
    end
    if fields.length == 0
      fields = '*'
    end
    if fields == '*'
      return fields
    else
      if fields.class == Array
        fields = fields.collect{ |d|
          if flexist.include? d
            d
          else
            nil
          end
        }
        fields = fields.compact.join(',')
        return fields
      else
        return fields
      end
    end
  end

  def do_query(query)
    res = $client.exec(query)
    out = res.collect{ |row| row }
    err = get_error(out)
    store = {"count" => out.length, "error" => err, "data" => out}
    return JSON.generate(store)
  end

  def get_error(x)
    if x.length == 0
      return { 'message' => 'no results found' }
    else
      return nil
    end
  end

end
