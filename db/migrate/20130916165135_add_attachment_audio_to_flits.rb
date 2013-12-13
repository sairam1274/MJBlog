class AddAttachmentAudioToFlits < ActiveRecord::Migration
  def self.up
    change_table :flits do |t|
      t.attachment :audio
    end
  end

  def self.down
    drop_attached_file :flits, :audio
  end
end
