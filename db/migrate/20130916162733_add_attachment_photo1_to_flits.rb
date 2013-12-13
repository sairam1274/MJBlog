class AddAttachmentPhoto1ToFlits < ActiveRecord::Migration
  def self.up
    change_table :flits do |t|
      t.attachment :photo1
    end
  end

  def self.down
    drop_attached_file :flits, :photo1
  end
end
