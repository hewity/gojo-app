class CreatePaperclipImages < ActiveRecord::Migration
  def change
    create_table :paperclip_images do |t|
      t.string :avatar

      t.timestamps null: false
    end
    add_attachment :paperclip_images, :avatar
  end
end
