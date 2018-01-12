class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true, uniqueness: true
  validates :file_name, presence: true
  validates :rule_value, presence: true
  validates :rule_name,  presence: true

end
