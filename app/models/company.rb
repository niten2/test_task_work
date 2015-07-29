class Company < ActiveRecord::Base
  has_many :persons
  has_many :favorites, as: :favorable, dependent: :destroy
end
