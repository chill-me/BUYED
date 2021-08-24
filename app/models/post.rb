class Post < ApplicationRecord

    validates :item_name, {presence: true}
    validates :price, {presence: true}

    belongs_to :user
    has_many :likes
    has_many :tag_relationships, dependent: :destroy
    has_many :tags, through: :tag_relationships

    def liked_by?(user)
     likes.where(user_id: user.id).exists?
    end

end
