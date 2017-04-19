class Moduleadmin < ActiveRecord::Base
    belongs_to :user
    belongs_to :modulecourse
end
