# models
class Repos < ActiveRecord::Base
	self.table_name = "repos"
end

class Travis < ActiveRecord::Base
	self.table_name = "travis"
end

class Github < ActiveRecord::Base
	self.table_name = "github"
end

class Cran < ActiveRecord::Base
	self.table_name = "cran"
end

class Cranlogs < ActiveRecord::Base
	self.table_name = "cranlogs"
end

class Appveyor < ActiveRecord::Base
	self.table_name = "appveyor"
end

class Groupings < ActiveRecord::Base
	self.table_name = "groupings"
end

class Categories < ActiveRecord::Base
	self.table_name = "categories"
end

class Citations < ActiveRecord::Base
	self.table_name = "citations"
end
