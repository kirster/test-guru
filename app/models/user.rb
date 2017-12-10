class User < ApplicationRecord

  devise  :database_authenticatable, 
          :registerable,
          :recoverable,
          :rememberable,
          :trackable, 
          :validatable,
          :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test'
  has_many :gists
  has_many :questions, through: :gists

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)  
  end

  def admin?
    self.is_a? Admin
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
    

end
