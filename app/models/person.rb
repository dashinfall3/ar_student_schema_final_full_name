require 'date'
require_relative '../../db/config'

class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.age < 5
      record.errors[:base] << "This person is a toddler!"
    end	
  end
end


class Person < ActiveRecord::Base
	REGEX = /\w*@\w*.[a-zA-Z]{2,5}/
	validates_with GoodnessValidator
	validates :email, :uniqueness => true
	validates :email, :format => { :with => REGEX,
					    			:message => "Only valid emails allowed" }
	validate :phone_number_size

	belongs_to :teacher

	def phone_number_size
		if self.phone.scan(/\d/).join('').length < 10
			errors.add(:discount, "too few numbers")
		end
	end

	def name
		"#{self.first_name} #{self.last_name}"
	end

	def age
		year_now = Date.today.strftime("%Y").to_i
		year_birth = self.birthday.strftime("%Y").to_i
		year_now - year_birth -1
	end
end