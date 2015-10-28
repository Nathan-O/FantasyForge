class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :title
      t.string :subtitle
      t.string :url

      t.belongs_to :map, index: true

      t.timestamps null: false
    end
  end
end
