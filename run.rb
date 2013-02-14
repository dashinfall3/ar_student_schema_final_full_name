require 'faker'
require_relative 'app/models/student.rb'
require_relative 'app/models/teacher.rb'



9.times do
      Teacher.create :first_name => Faker::Name.first_name,
                     :last_name  => Faker::Name.last_name,
                     :email      => Faker::Internet.email,
                     :phone      => Faker::PhoneNumber.phone_number
    end


60.times do
      Student.create :first_name => Faker::Name.first_name,
                     :last_name  => Faker::Name.last_name,
                     :email      => Faker::Internet.email,
                     :teacher_id => (0..Teacher.all.length-1).to_a.sample

                     # :teacher_id => (0..Teacher.all.length-1).to_a.sample
                     
    end



puts s = Student.find(360).teacher.inspect

