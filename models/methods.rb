# functions
def get_repo(params)
  name = params[:name]
  fields = params[:fields] || '*'
  params.delete("fields")
  #fields = check_fields(fields)

  if name.nil?
  	nms = pkg_names()
  	tmp = []
    nms.each{ |x|
      tmp << concat_query(x, fields)
    }
    return tmp
  else
    return concat_query(name, fields)
  end
end

def get_repo_table(table)
  name = params[:name]
  fields = params[:fields] || '*'
  params.delete("fields")
  #fields = check_fields(fields)
  case table
	when 'travis'
		res = Travis.select(fields).where(:name => name)
	when 'github'
		res = Github.select(fields).where(:name => name)
	when 'cran'
		res = Cran.select(fields).where(:name => name)
	when 'cranlogs'
		res = Cranlogs.select(fields).where(:name => name)
	when 'appveyor'
		res = Appveyor.select(fields).where(:name => name)
	end
  return res
end

def get_repo_deps
  res = Cran.select('*').where(:name => params[:name])
  if res.length == 0
  	return []
  else
		res = res.as_json[0].select { |k,v| k[/depends|imports|suggests|enhances/] }
  	return res
  end
end


def get_repo_citations
  return Citations.select('doi,citation').where(:name => params[:name])
end



def get_repo_groupings
  return Groupings.select('grouping').where(:name => params[:name])
end

def get_all_groupings
  # return Groupings.select('grouping')
  return Groupings.uniq.pluck(:grouping)
end

def get_groupings
  return Groupings.select('name').where(:grouping => params[:grouping])
end



def get_repo_categories
  return Categories.select('category').where(:name => params[:name])
end

def get_all_categories
  return Categories.uniq.pluck(:category)
end

def get_categories
  return Categories.select('name').where(:category => params[:category])
end


def pkg_names
  pkgs1 = Repos.select('name')
  pluck(pkgs1, "name").flatten
end

def pluck(x, var)
  x.map {|i| i[var] }
end

def concat_query(name, fields)
  # tables = ['repos','cran','cranlogs','github','appveyor']
  tables = ['repos','cranlogs','github','appveyor']
  out = {}
  #errors = {}
  tables.each { |x|
    case x
    when 'repos'
      res = Repos.where(:name => name).select(fields)
    when 'github'
      res = Github.select("*").where(:name => name).order('inserted DESC').limit(1)
    when 'cran'
      res = Cran.select("*").where(:name => name).order('inserted DESC').limit(1)
    when 'cranlogs'
      res = Cranlogs.select("*").where(:name => name).order('inserted DESC').limit(1)
    when 'appveyor'
      res = Appveyor.select("*").where(:name => name).order('inserted DESC').limit(1)
    end

    if x == 'repos'
      x = "metadata"
    end
    #errors.store(x, res['error'])
    out.store(x, res.as_json)
  }
  out["name"] = name
  return out
end

