require_relative '../../db/config'
require 'date'


class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.age < 5
      record.errors[:base] << "This person is a toddler!"
    end
    	
  end
end

# implement your Student model here
class TeacherStudent < ActiveRecord::Base
	belongs_to :teacher
  	belongs_to :student

end


