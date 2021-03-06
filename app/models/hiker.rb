class Hiker < ApplicationRecord
    has_one_attached :avatar
    has_many :favorites
    has_many :trails, through: :favorites
    has_many :reviews

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    # validates :password, presence: true
    # validates :password, length: { in: 6..12, message: "should be between 6 - 12 characters long" }

    def display_rating(trail_id)
       review = self.reviews.find { |review| review.trail_id == trail_id }
       if review 
        review.rating
       else 
        "Have not rated"
       end 
    end 

end


    