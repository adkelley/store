class ApiToken < ActiveRecord::Base
  belongs_to  :store_it
  validates :hex_value, presence: true, uniqueness: true
end
