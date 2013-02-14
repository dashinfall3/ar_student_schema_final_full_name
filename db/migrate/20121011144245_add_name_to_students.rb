require_relative '../config'

class AddNameToStudents < ActiveRecord::Migration
  def up
  	change_table :students do |t|
	    t.string :full_name
	end
	Student.all.each do |student|
		student.update_attribute(:full_name, "#{student.first_name} #{student.last_name}")
	end
	change_table :students do |t|
	    remove_column :students, :first_name
	  	remove_column :students, :last_name
	end
  end
end


