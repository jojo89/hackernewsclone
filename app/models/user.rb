class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: { with: /\w+\@.+\.\w{2,}/ }
  validates :password, length: { minimum: 2 } 

  has_many :posts
  has_many :comments
  # Remember to create a migration!

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
