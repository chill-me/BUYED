class Post < ApplicationRecord

    validates :item_name, {presence: true}
    validates :price, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end


end
