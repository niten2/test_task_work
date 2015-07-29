class Favorite < ActiveRecord::Base
  belongs_to :favorable, polymorphic: true
  belongs_to :user

  default_scope { order(created_at: "DESC") }

  scope :find_user, -> (user) { where(user: user).first }

  def self.user_exists(model, user)
    model.favorites.where(user: user).first
  end
end
