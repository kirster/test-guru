class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
