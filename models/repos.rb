class Repos < ActiveRecord::Base
	self.table_name = "repos"
end

# params={'fields': '*', 'name': 'taxize'


# class Repos < ActiveRecord::Base
# 	self.table_name = "repos"

# 	def self.endpoint(params, pkg)
# 		params.delete_if { |k, v| v.nil? || v.empty? }
# 		select(params['fields'])
# 				.where(:name => params['name'])
# 	end
# end
