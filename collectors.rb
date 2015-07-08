# setup
$ghclient = Octokit::Client.new(:access_token => ENV["GITHUB_TOKEN_ROAPI"])

# do all
# repos = ['ropensci/taxize', 'ropensci/rplos']
# do_github(repos)
# repos = ['ropensci/taxize', 'ropensci/rplos', "5"]
# do_github(repos)
def do_github(repos, fun)
	out = []
	repos.each do |x|
		begin
	  	out << github(x)
	  rescue => detail
		  nil
		end
	end
	return out
end

# repos = ['ropensci/taxize', 'ropensci/rplos']
# do_travis(repos)
def do_travis(repos)
	out = []
	repos.each do |x|
		begin
	  	out << travis(x)
	  rescue => detail
		  nil
		end
	end
	return out
end

# repos = ['taxize', 'rplos']
# do_cranlogs(repos)
def do_cranlogs(repos)
	out = []
	repos.each do |x|
		begin
			tmp = cranlogs(x)
	  rescue => detail
		  nil
		end

		begin
			upquery = sprintf("UPDATE cranlogs SET cran_downloads = %<cran_downloads>d, collected = '%<collected>s' " % tmp) + sprintf("WHERE name = '%s'" % x)
			res = $client.exec(upquery)
		rescue PG::Error => err
			 	p err.result.error_field(PG::Result::PG_DIAG_MESSAGE_DETAIL)
		end
	end
	print 'cranlogs updated!'
end

# repos = ['sckott/elasticdsl', 'sckott/solr']
# do_appveyor(repos)
def do_appveyor(repos)
	out = []
	repos.each do |x|
		begin
	  	out << appveyor(x)
	  rescue => detail
		  nil
		end
	end
	return out
end

# repos = ['taxize', 'solr', 'elastic']
# do_cran(repos)
def do_cran(repos)
	out = []
	repos.each do |x|
		begin
	  	out << cran(x)
	  rescue => detail
		  nil
		end
	end
	return out
end

# write data to postgres
# write_data(<data>, "cranlogs")
def write_data(data, table)
	query = "INSERT INTO " + table + " VALUES " + data
  res = $client.exec(query)
  out = res.collect{ |row| row }
  err = get_error(out)
  store = {"count" => out.length, "error" => err, "data" => out}
  return JSON.generate(store)
end

# github(repo = "ropensci/taxize")
def github(repo)
	repo = $ghclient.repository(repo)
 	get = [:id, :name, :created_at, :updated_at, :size, :language, :forks, :open_issues, :watchers, :default_branch]
	get_bykey(repo, get).to_h
end

def get_bykey(x, y)
	x.reject {|k,v| !y.include?(k)}
end

# travis(repo = "ropensci/taxize")
def travis(repo)
	Travis.access_token = ENV['TRAVIS_TOKEN']
	res = Travis::Repository.find(repo)
	res.last_build.to_h
end

# cranlogs(pkg = "taxize")
def cranlogs(pkg)
	require 'HTTParty'
	base = sprintf "http://cranlogs.r-pkg.org/downloads/total/2012-01-01:%s/" % Date.today.prev_day.to_s
	res = HTTParty.get(base + pkg)
	return {"pkg": pkg, "cran_downloads": res[0]['downloads'], "collected": Time.now.utc.to_s}
end

# appveyor(repo = "sckott/elasticdsl")
def appveyor(repo)
	appveyor_base = 'https://ci.appveyor.com/api/projects/'
	headers = {
		"Content-Type" => "application/json",
		"Authorization" => "Bearer " + ENV['APPVEYOR_API_TOKEN']
	}
	res = HTTParty.get(appveyor_base + repo, :headers => headers)
	return res
end

# cran(repo = "taxize")
def cran(repo)
	base = sprintf "http://crandb.r-pkg.org/%s" % repo
	res = HTTParty.get(base)
	return res
end

# coveralls(repo = "ropensci/taxize")
# ## not working
# def coveralls(repo)
# 	Travis.access_token = ENV['TRAVIS_TOKEN']
# 	res = Travis::Repository.find(repo)
# 	lb = res.last_build
# 	lb.attributes
# end
