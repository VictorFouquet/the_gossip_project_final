class CreateGossip < ActiveRecord::Migration[5.2]
  def change
      create_table :gossips do |t|
      t.string :title	
      t.text :content
      t.datetime :date
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
