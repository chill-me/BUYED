class Post < ApplicationRecord

    validates :item_name, {presence: true}
    validates :price, {presence: true}

    belongs_to :user
    has_many :likes



end
