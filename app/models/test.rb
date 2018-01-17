class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :category
  has_many :questions

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  scope :for_category, -> (category) { joins(:category).where(categories: { title: category} ) }
  scope :descending, -> { order(title: :desc) }
  scope :for_level, -> (level) { where(level: level) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_nil: true 

  def self.tests_by_category(category)
    self.for_category(category).descending
  end

  def questions_amount
    Rails.cache.write("test_#{self.id}", self.questions.count)
  end

end
