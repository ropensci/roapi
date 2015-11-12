require 'rubygems'
require 'sinatra'
require 'json'
require 'pg'
# require 'octokit'
# require 'coveralls'
# require 'travis'
require "httparty"
require "sinatra/multi_route"
require File.join File.dirname(__FILE__), "roapi_utils"

class ROApp < Sinatra::Application
  register Sinatra::MultiRoute

  # Set up PostgreSQL
  val = ENV['SSH_CLIENT']
  if val.to_s == ''
    $client = PG.connect( dbname: 'roapi', user: 'postgres', password: 'root' )
  else
    $client = PG.connect(
      :password => ENV['POSTGRES_PASSWORD'],
      :user => "sckott",
      :dbname => "roapi"
    )
  end

  # before do
  #   # puts '[ENV]'
  #   # p ENV['ROAPI_USER']
  #   # puts '[Params]'
  #   # p params
  #   puts '[body]'
  #   p JSON.parse(request.body.read)
  # end

  ## configuration
  configure do
    set :raise_errors, false
    set :show_exceptions, false
  end

  # halt: error helpers
  error 400 do
    halt 400, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'malformed request' })
  end

  error 401 do
    halt 401, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'unauthorized' })
  end

  not_found do
    halt 404, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'route not found' })
  end

  error 405 do
    halt 405, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'Method Not Allowed' })
  end

  error 500 do
    halt 500, {'Content-Type' => 'application/json'}, JSON.generate({ 'error' => 'server error' })
  end

  # headers and auth helpers
  helpers do
    def headers_get
      headers "Content-Type" => "application/json; charset=utf8"
      headers "Access-Control-Allow-Methods" => "HEAD, GET"
      headers "Access-Control-Allow-Origin" => "*"
      cache_control :public, :must_revalidate, :max_age => 60
    end

    def headers_auth
      headers "Content-Type" => "application/json; charset=utf8"
      headers "Access-Control-Allow-Methods" => "HEAD, GET, POST, PUT, DELETE"
      headers "Access-Control-Allow-Origin" => "*"
      cache_control :public, :must_revalidate, :max_age => 60
    end

    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == [ENV['ROAPI_USER'], ENV['ROAPI_PWD']]
    end
  end

  ## routes
  get '/' do
    headers_get
    redirect '/heartbeat'
  end

  get '/docs' do
    headers_get
    redirect 'https://github.com/ropensci/roapi/wiki'
  end

  get "/heartbeat/?" do
    headers_get
    $ip = request.ip
    return JSON.pretty_generate({
      "routes" => [
        "/docs (GET)",
        "/heartbeat (GET)",
        "/repos (GET)",
        "/repos/:repo_name: (GET) (POST, PUT, DELETE [auth])",
        "/repos/:repo_name:/history (GET)"
      ]
    })
  end

  get '/repos/?:name?/?' do
    headers_get
    get_repo()
  end

  # auth required for post, put, delete
  # post '/testauth/?' do
  #   protected!
  #   headers_auth
  #   return JSON.generate({ 'message' => 'nice work' })
  # end

  post '/repos/:name/?' do
    protected!
    headers_auth
    res = add_repo()
    if res.result_status == 1
      status 201
      body JSON.generate({ "message" => "created" })
    else
      halt 400
    end
  end

  put '/repos/:name/?' do
    protected!
    headers_auth
    res = edit_repo()
    if res.result_status == 1
      status 201
      body JSON.generate({ "message" => "record modified" })
    else
      halt 400
    end
  end

  delete '/repos/:name/?' do
    protected!
    headers_auth
    res = delete_repo()
    if res['deleted']
      status 204
      body ''
    else
      res.delete('deleted')
      halt 400
    end
  end

  # prevent some HTTP methods
  route :copy, :patch, :options, :trace, '/*' do
    halt 405
  end

end
