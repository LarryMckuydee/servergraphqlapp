class Employee < ApplicationRecord
  enum role: {
    admin: 0,
    salesman: 1,
    finance: 2
  }
  belongs_to :company
  belongs_to :department
end
