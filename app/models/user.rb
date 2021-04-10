class User < ApplicationRecord
    validates :email, {presence: true}
    validates :password, {presence: true,uniqueness: true}

    has_many :likes
    has_many :posts

end
