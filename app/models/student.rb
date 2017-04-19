class Student < ActiveRecord::Base
    self.primary_key = :student_number
    belongs_to :user
    has_many :modulecourse
end
