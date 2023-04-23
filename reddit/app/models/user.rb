class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 
    validates :password, length: {minimum: 6}, allow_nil: true 
    validates :session_token, presence: true, uniqueness: true 
    

    
    has_many :posts, 
    foreign_key: :author_id

    has_many :subs, 
    foreign_key: :user_id
end
