class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.string :url

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
