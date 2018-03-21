class User < ApplicationRecord
    belongs_to :role
    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy

    has_secure_password

    before_create { generate_token(:auth_token) }
    before_create :confirmation_token

    def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    
    validates :password, presence: true, length: { minimum: 8, message: "must be at least 8 characters long" }

    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
end
