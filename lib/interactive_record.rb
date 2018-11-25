require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
		self.class.to_s.downcase.pluralize
	end
	
	def self.column_names 
	  sql = "PRAGMA table_info #{self.table_name})"
	  result = DB[:CONN].execute(sql)
	  colunms = []
	  result.each{|c| columns << c[#{"name"}] }
	  columns.compact
	end 

  def self.find_by_name(name)
    sql = "SELECT * FROM #{self.table_name} WHERE name = '#{name}'"
    DB[:conn].execute(sql)
  end
end