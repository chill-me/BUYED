class User < ApplicationRecord
    validates :email, {presence: true}
    validates :password, {presence: true,uniqueness: true}

    has_many :likes
    has_many :posts

    has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
    has_many :followings, through: :following_relationships
    has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :follower_relationships

    def following?(other_user)
        self.followings.include?(other_user)
    end

end
