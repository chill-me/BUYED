class User < ApplicationRecord
    validates :email, {presence: true}
    validates :password, {presence: true,uniqueness: true}
end
