class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    Test.joins(:tests_users).where("user_id = :id AND level = :level", id: self.id, level: level)
  end
end
