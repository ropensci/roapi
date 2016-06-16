require 'yaml'
require 'active_record'

config = YAML::load_file(File.join(__dir__, 'config.yaml'))
ActiveRecord::Base.establish_connection(config['db']['roapi'])


class Cran < ActiveRecord::Base
  self.table_name = "cran"
  select("*")
end

Cran.
