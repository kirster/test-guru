class Test < ApplicationRecord

  before_validation :before_validation_set_author, on: :create

  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
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

  def self.tests_by_category(category)
    self.for_category(category).descending
  end

  def set_author(current_user)
    @current_user = current_user
  end

  private

  def before_validation_set_author
    self.author = @current_user
  end

end
