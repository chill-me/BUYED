class Post < ApplicationRecord

    validates :item_name, {presence: true}

end
