class User < ApplicationRecord
    belongs_to :role
    has_many :orders, dependent: :destroy

    has_secure_password

    before_create { generate_token(:auth_token) }

    def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end

    #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, presence: true, length: { maximum: 255 },
    #                  format: { with: VALID_EMAIL_REGEX }
    
    #validates :password, presence: true, length: { minimum: 8, message: "Password must be at least 8 characters long" }
end
