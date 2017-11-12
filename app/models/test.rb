class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
