class Post < ApplicationRecord

    validates :item_name, {presence: true}
    validates :price, {presence: true}


end
