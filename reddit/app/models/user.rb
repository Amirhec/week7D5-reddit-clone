class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :username, presence: true, uniqueness: true 
    validates :password, length: {minimum: 6}, allow_nil: true 
    validates :session_token, presence: true, uniqueness: true 

    attr_reader :password

    has_many :posts, 
    foreign_key: :author_id

    has_many :subs, 
    foreign_key: :user_id


    def self.find_by_credentials(username,password)
        user = User.find_by(username: username)

        if user && is_password?(password)
            return user 
        else
            return nil 
        end
    end

    def is_password?(password)
        bcrypt_obj = BCrypt::Password.new(self.password_digest)
        bcrypt_obj.is_password?(password)
    end

    def generate_session_token 
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token||= generate_session_token 
    end

    def reset_session_token 
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end





    
 
end
