class CreateFlits < ActiveRecord::Migration
  def change
    create_table :flits do |t|
      t.integer :user_id, :null => false
      t.string :message, :null => false
      t.datetime :created_at, :null => false

      t.timestamps
    end
  end
end
