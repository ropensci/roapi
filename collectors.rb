# setup
# load all
require 'octokit'
require 'coveralls'
require 'travis'
require 'httparty'
require 'time'
# require '/Users/sacmac/github/ropensci/roapi/api.rb'
# require '/Users/sacmac/github/ropensci/roapi/collectors.rb'
$ghclient = Octokit::Client.new(:access_token => ENV["GITHUB_TOKEN_ROAPI"])


# Get data, send to SQL
## data_source = one of github, travis, appveyor, cran, cranlogs
# doit('cran')
# doit('appveyor')
def doit(x)
	github_str = "INSERT INTO github (id, name, created_at, updated_at, size, language, forks, open_issues, watchers, default_branch, inserted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)"
	travis_str = "INSERT INTO travis (name, repository_id, commit_id, number, pull_request, pull_request_number, pull_request_title, state, started_at, finished_at, duration, job_ids, language, os, inserted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)"
	appveyor_str = "INSERT INTO appveyor (projectid, accountid, accountname, name, repositoryname, repositorybranch, created, updated, buildid, buildnumber, version, message, branch, commitid, committername, status, finished, inserted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18)"
	cranlogs_str = "INSERT INTO cranlogs (name, cran_downloads, collected, inserted) VALUES ($1, $2, $3, $4)"
	# cran_str = "INSERT INTO cran (package, title, description, version, license, url, bugreports, authors_r, layload, lazydata, vignettebuilder, depends, imports, suggests, needscompilation, packaged, author, maintainer, repository, crandb_file_date, date, releases, date_publication, inserted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24)"

	case x
	when "github"
		puts "doing github"
		mdat = get_field("route_github_travis")
		names = mdat.collect{|x| x['name']}
		paths = mdat.collect{|x| x['route_github_travis']}
		output = do_github(paths)
		res = Hash[names.zip(output)]
		res2 = res.reject{|x,y| y.nil?}
		res2.collect{|a,b|  b.store(:inserted, Time.now.utc)}
		res2.each{|a,b| write_data(github_str, b.values)}
	when "travis"
		puts "not working yet"
		# puts "doing travis"
		# mdat = get_field("route_github_travis")
		# names = mdat.collect{|x| x['name']}
		# paths = mdat.collect{|x| x['route_github_travis']}
		# output = do_travis(paths)
		# res = Hash[names.zip(output)]
		# res2 = res.reject{|x,y| y.nil?}
		# res2.collect{|a,b|  b.store(:inserted, Time.now.utc)}
		# res2.each{|a,b| write_data(travis_str, b.values)}
	when "cranlogs"
		puts "doing cranlogs"
		names = get_pkg_names()
		output = do_cranlogs(names)
		res = Hash[names.zip(output)]
		res2 = res.reject{|x,y| y.nil?}
		res2.collect{|a,b|  b.store(:inserted, Time.now.utc)}
		res2.each{|a,b| write_data(cranlogs_str, b.values)}
	when "cran"
		puts "doing cran"
		names = get_pkg_names()
		output = do_cran(names)
		res2 = clean_up(names, output)
		res2.collect{|a,b|
			keys = generate_keys(b.keys)
			rep = (1..b.values.length).step(1).to_a
  		repdoll = rep.collect{ |x| "$" + x.to_s }
  		dolls = sprintf("(%s)", repdoll.join(', '))
  		str = sprintf("INSERT INTO cran %s VALUES %s", keys, dolls)
			write_data(str, b.values)
		}
	when "appveyor"
		puts "doing appveyor"
		mdat = get_field("route_appveyor")
		names = mdat.collect{|x| x['name']}
		paths = mdat.collect{|x| x['route_appveyor']}
		output = do_appveyor(paths)
		res2 = clean_up(names, output)
		res2.collect{|a,b|
			keys = generate_keys(b.keys)
			rep = (1..b.values.length).step(1).to_a
  		repdoll = rep.collect{ |x| "$" + x.to_s }
  		dolls = sprintf("(%s)", repdoll.join(', '))
  		str = sprintf("INSERT INTO appveyor %s VALUES %s", keys, dolls)
			write_data(str, b.values)
		}
	else
		puts "not found"
	end
end

def get_pkg_names
	mdat = get_field("name")
	return mdat.collect{|x| x['name']}
end

def clean_up(nms, input)
	res = Hash[nms.zip(input)]
	res2 = res.reject{|x,y| y.nil?}
	return res2.each{|a,b| b.store(:inserted, Time.now.utc)}
end

def write_data(str, values)
	begin
		$client.exec("DEALLOCATE insert")
	rescue Exception => e
		nil
	end
  $client.prepare('insert', str)
  $client.exec_prepared('insert', values)
  $client.exec("DEALLOCATE insert")
end

# get_field(field="route_github_travis")
# get_field(field="route_appveyor")
def get_field(field)
  query = sprintf("SELECT name,%s FROM repos WHERE %s IS NOT NULL", field, field)
  res = $client.exec(query)
  return res.collect{ |row| row }
  # return out.collect{|x| x.values}.flatten.compact
end

# GETTERS for each source
## do all
# repos = ['ropensci/taxize', 'ropensci/rplos']
# do_github(repos)
# repos = ['ropensci/taxize', 'ropensci/rplos', "5"]
# do_github(repos)
def do_github(repos)
	out = []
	repos.each do |x|
		begin
			out << github(x)
		rescue => detail
			out << nil
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
			out << nil
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
			out << cranlogs(x)
		rescue => detail
			out << nil
		end
		# begin
		# 	upquery = sprintf("UPDATE cranlogs SET cran_downloads = %<cran_downloads>d, collected = '%<collected>s' " % tmp) + sprintf("WHERE name = '%s'" % x)
		# 	res = $client.exec(upquery)
		# rescue PG::Error => err
		# 		p err.result.error_field(PG::Result::PG_DIAG_MESSAGE_DETAIL)
		# end
	end
	return out
	# print 'cranlogs updated!'
end

# repos = ['sckott/elasticdsl', 'sckott/solr']
# repos = ['sckott/elasticdsl', 'sckott/solr', 'sckott/taxize', 'sckott/elastic', 'sckott/lawn']
# do_appveyor(repos)
def do_appveyor(repos)
	out = []
	repos.each do |x|
		begin
			out << appveyor(x)
		rescue => detail
			out << nil
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
			out << nil
		end
	end
	return out
end

# write data to postgres
# write_data(<data>, "cranlogs")
# def write_data(data, table)
# 	query = "INSERT INTO " + table + " VALUES " + data
# 	res = $client.exec(query)
# 	out = res.collect{ |row| row }
# 	err = get_error(out)
# 	store = {"count" => out.length, "error" => err, "data" => out}
# 	return JSON.generate(store)
# end

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
	tmp = res.last_build.to_h
	conf = tmp['config']
	conf.delete("notifications")
	conf2 = conf.collect { |x,y|
		if y.to_s.length > 1 and y.class == Array
			[[x, y.join(", ")]].to_h
		else
			[[x, y.to_s]].to_h
		end
	}
	conf2 = conf2.reduce &:merge
	tmp.delete("config")
	tmp2 = [tmp, conf2].reduce &:merge
	get = ["repository_id", "commit_id", "number", "pull_request",
		"pull_request_number", "pull_request_title", "state", "started_at",
		"finished_at", "duration", "job_ids", "language", "os"]
	tmp3 = get_bykey(tmp2, get).to_h
	tmp3['started_at'] = Time.parse(tmp3['started_at'].to_s).iso8601
	tmp3['finished_at'] = Time.parse(tmp3['finished_at'].to_s).iso8601
	tmp3['job_ids'] = tmp3['job_ids'].join(", ")
	tmp3['name'] = repo.split('/')[1]
	return tmp3
end

# cranlogs(pkg = "taxize")
def cranlogs(pkg)
	base = sprintf "http://cranlogs.r-pkg.org/downloads/total/2012-01-01:%s/" % Date.today.prev_day.to_s
	res = HTTParty.get(base + pkg)
	res = res.parsed_response
	return {"name": pkg, "cran_downloads": res[0]['downloads'], "collected": Time.now.utc.to_s}
end

# appveyor(repo = "sckott/elasticdsl")
def appveyor(repo)
	appveyor_base = 'https://ci.appveyor.com/api/projects/'
	headers = {
		"Content-Type" => "application/json",
		"Authorization" => "Bearer " + ENV['APPVEYOR_API_TOKEN']
	}
	res = HTTParty.get(appveyor_base + repo, :headers => headers)
	res = res.parsed_response
	proj_get = ["projectId", "accountId", "accountName", "name",
		"repositoryName", "repositoryBranch", "created", "updated"]
	build_get = ["buildId", "buildNumber", "version", "message",
		"branch", "commitId", "committerName", "commited", "status",
		"finished"]
	proj = get_bykey(res["project"], proj_get).to_h
	build = get_bykey(res["build"], build_get).to_h
	out = [proj, build].reduce &:merge
	out["updated"] = out["updated"] || nil
	out = Hash[out.map{|(k,v)| [k.to_sym,v]}]
	return out.downcase_key
end

# cran(repo = "taxize")
def cran(repo)
	base = sprintf "http://crandb.r-pkg.org/%s" % repo
	res = HTTParty.get(base)
	res = res.parsed_response
	res = proc_imports_helper(res, "Suggests")
	res = proc_imports_helper(res, "Depends")
	res = proc_imports_helper(res, "Imports")
	res['releases'] = res['releases'].join(", ")
	res = res.collect{|x,y|
		if y.length == 0
			[[x, nil]].to_h
		else
			[[x, y]].to_h
		end
	}
	res = res.reduce &:merge
	res["date_publication"] = res.delete("Date/Publication")
	res['date_publication'] = Time.parse(res['date_publication']).iso8601
	res['crandb_file_date'] = Time.parse(res['crandb_file_date']).iso8601
	if res.key?('Collate')
		res['pkg_collate'] = res.delete('Collate')
	end
	res = Hash[res.collect { |k,v| [k.to_s.sub('@','_'), v] }]
	res = Hash[res.map{|(k,v)| [k.to_sym,v]}]
	res = res.downcase_key
	res.delete(:date)
	return res
end

def proc_imports_helper(obj, keyname)
	if obj.key?(keyname)
		obj[keyname] = proc_imports(obj, keyname)
	end
	return obj
end

def proc_imports(x, key)
	tmp = x[key]
	return tmp.collect{|a,b| sprintf("%s/%s", a, b) }.join(", ")
end

class Hash
  def downcase_key
    keys.each do |k|
      store(k.downcase, Array === (v = delete(k)) ? v.map(&:downcase_key) : v)
    end
    self
  end
end

# coveralls(repo = "ropensci/taxize")
# ## not working
# def coveralls(repo)
# 	Travis.access_token = ENV['TRAVIS_TOKEN']
# 	res = Travis::Repository.find(repo)
# 	lb = res.last_build
# 	lb.attributes
# end
