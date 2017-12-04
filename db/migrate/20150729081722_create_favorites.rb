class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favorable, polymorphic: true, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
