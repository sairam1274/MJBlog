class AddFlitIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :flit_id, :integer
  end
end
