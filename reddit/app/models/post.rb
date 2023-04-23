class Post < ApplicationRecord

    validates :title, presence: true 
    validates :url, optional: true 
    validates :content, optional: true 
    validates :sub_id, presence: true 
    validates :author_id, presence: true 


    belongs_to :author,
    class_name: :User
    
    belongs_to :sub
end
