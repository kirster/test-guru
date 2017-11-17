class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :categorized, -> (category) { where(categories: { title: category} ) }
  scope :descending, -> { order(title: :desc) }

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0 },
                    uniqueness: true 

  def self.tests_by_category(category)
    Test.joins(:category).categorized(category).descending
  end
end
