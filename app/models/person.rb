class Person < ActiveRecord::Base
  belongs_to :company
  has_many :favorites, as: :favorable, dependent: :destroy
end
