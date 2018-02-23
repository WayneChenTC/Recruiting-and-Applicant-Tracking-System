class AddAttachmentDocumentToApplications < ActiveRecord::Migration[5.1]
  def self.up
    change_table :applications do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :applications, :document
  end
end
