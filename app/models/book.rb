class Book < ApplicationRecord
    belongs_to :user
    has_many :favorites
    has_many :comments
	validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 75 }
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def Book.search(search, user_or_post, how_search)
        if how_search == "1"
            Book.where(['title LIKE ?', "%#{search}%"])
        elsif how_search == "2"
            Book.where(['title LIKE ?', "%#{search}"])
        elsif how_search == "3"
            Book.where(['title LIKE ?', "#{search}%"])
        elsif how_search == "4"
            Book.where(['title LIKE ?', "#{search}"])
        else
            Book.all
        end
    end
end
