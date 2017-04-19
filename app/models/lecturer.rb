class Lecturer < ActiveRecord::Base
    belongs_to :user
    has_many :modulecourses
end
