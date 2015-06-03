# setup
$ghclient = Octokit::Client.new(:access_token => "e61ddfb03d8970e8237b55749e123dcbfc578530")

# do all
# repos = ['taxize', 'rplos', 5]
def do_github(repos)
	repos.each do |x|
		begin
	  	github(x)
		rescue => detail
		  nil
		end
	end
end

# write data to postgres
# write_data(<data>, "github")
def write_data(data, table)
	data = proc_data(data) # write this function
	query = sprintf "INSERT INTO %s VALUES %s" % table % data
  res = $client.exec(query)
  out = res.collect{ |row| row }
  err = get_error(out)
  store = {"count" => out.length, "error" => err, "data" => out}
  return JSON.generate(store)
end

# github("ropensci/taxize")
def github(repo)
	repo = $ghclient.repository(repo)
	get = ["created_at", "updated_at", "size", "language", "forks", "open_issues", "watchers", "default_branch"]
	getall = get.join("|")

	repo.each do |k, v|
		tm = k.match(getall)
		if tm.nil?
			nil
		else
			k
		end
	end
end

# travis(repo = "ropensci/taxize")
def travis(repo)
	Travis.access_token = ENV['TRAVIS_TOKEN']
	res = Travis::Repository.find(repo)
	lb = res.last_build
	lb.attributes
end

# cranlogs(pkg = "taxize")
def cranlogs(pkg)
	require 'HTTParty'
	base = sprintf "http://cranlogs.r-pkg.org/downloads/total/2012-01-01:%s/" % Date.today.prev_day.to_s
	res = HTTParty.get(base + pkg)
	{"cran_downloads": res[0]['downloads']}
end

# appveyor(pkg = "ropensci/taxize")
def appveyor(repo)
	# require 'HTTParty'
	# base = sprintf "http://cranlogs.r-pkg.org/downloads/total/2012-01-01:%s/" % Date.today.prev_day.to_s
	# res = HTTParty.get(base + pkg)
	# {"cran_downloads": res[0]['downloads']}
end

# cran(pkg = "taxize")
def cran(pkg)
	# require 'HTTParty'
	# base = sprintf "http://cranlogs.r-pkg.org/downloads/total/2012-01-01:%s/" % Date.today.prev_day.to_s
	# res = HTTParty.get(base + pkg)
	# {"cran_downloads": res[0]['downloads']}
end

# coveralls(repo = "ropensci/taxize")
def coveralls(repo)
	# Travis.access_token = ENV['TRAVIS_TOKEN']
	# res = Travis::Repository.find(repo)
	# lb = res.last_build
	# lb.attributes
end
