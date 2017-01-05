class Company < ApplicationRecord
  GlobalID::Identification
  has_and_belongs_to_many :departments
  has_many :employees
end
