class Cran < ActiveRecord::Base
  self.table_name = "cran"
  select("*")
end

Cran.
