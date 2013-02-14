require 'faker'
require_relative 'app/models/student.rb'
require_relative 'app/models/teacher.rb'
require_relative 'app/models/teacher_student.rb'

#generating fields are here



#tests are here

puts Student.find(360).teachers.length == 2

puts Teacher.find(122).students.length == 4





