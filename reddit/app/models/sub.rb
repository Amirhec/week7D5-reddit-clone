class Sub < ApplicationRecord
    validates :title, optional: true 
    validates :description, presence: true 
    validates :user_id, presence: true 


    belongs_to :user
    
    has_many :posts
end
