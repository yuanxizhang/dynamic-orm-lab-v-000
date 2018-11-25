require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name
		self.class.to_s.downcase.pluralize
	end
	
	def self.column_names 
	  DB[:conn].results_as_hash = true
	  sql = "PRAGMA table_info #{self.table_name})"
	  table_info = DB[:CONN].execute(sql)
	  colunms = []
	  table_info.each{|c| columns << c["name"] }
	  columns.compact
	end 
	
	def initialize(options ={})
	  options.each{|key, value| send("#{key}=", value)}
  end 
  
  def table_name_for_insert 
     self.class.table_name
  end
  
  def column_names_for_insert
    self.class.column_names.join(", ")
  end
  
  def values_for_insert 
    values = []
    
    values.join(", ")
  end  
  
  def self.find_by_name(name)
    sql = "SELECT * FROM #{self.table_name} WHERE name = '#{name}'"
    DB[:conn].execute(sql)
  end
end