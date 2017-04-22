class Grade < ActiveRecord::Base
    validates :grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100,  only_integer: true }
end
