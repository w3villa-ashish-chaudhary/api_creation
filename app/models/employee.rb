class Employee < ApplicationRecord

  validates  :name,:email, presence: true, uniqueness: { case_sensitive: false },  length: { minimum: 2, maximum: 30 }
  
end
