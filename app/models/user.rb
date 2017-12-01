class User < ApplicationRecord

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test'

  validates :user_name, presence: true, length: { minimum: 3 }
  
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            format: { with:  EMAIL_FORMAT }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)  
  end

end
