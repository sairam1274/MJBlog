class AddAttachmentVideoToFlits < ActiveRecord::Migration
  def self.up
    change_table :flits do |t|
      t.attachment :video
    end
  end

  def self.down
    drop_attached_file :flits, :video
  end
end
