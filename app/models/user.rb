class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    Test.joins(:tests_users).where("user_id = :id AND level = :level", id: self.id, level: level)
  end
end
