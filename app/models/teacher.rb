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
class Teacher < ActiveRecord::Base
	REGEX = /\w*@\w*.[a-zA-Z]{2,5}/
	# validates_with GoodnessValidator
	validates :email, :uniqueness => true
	validates :email, :format => { :with => REGEX,
					    			:message => "Only valid emails allowed" }
	validate :phone_number_size
	
	has_many :teacher_students
	has_many :students, :through => :teacher_students

	def phone_number_size
		if self.phone.scan(/\d/).join('').length < 10
			errors.add(:discount, "too few numbers")
		end
	end

	def name
		"#{self.first_name} #{self.last_name}"
	end

end



