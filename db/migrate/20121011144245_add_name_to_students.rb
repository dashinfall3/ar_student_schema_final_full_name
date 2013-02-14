require_relative '../config'

class AddNameToStudents < ActiveRecord::Migration
  def up
  	change_table :students do |t|
	    t.string :name
	    t.string :address
	end
	Student.all.each do |student|
		student.update_attribute(:name, "#{student.first_name} #{student.last_name}")
	end
	change_table :students do |t|
	    remove_column :students, :first_name
	  	remove_column :students, :last_name
	end
  end

  def down
	change_table :students do |t|
	    remove_column :students, :name
	  	add_column :students, :first_name, :string
	  	add_column :students, :last_name, :string
	end
  end
end


