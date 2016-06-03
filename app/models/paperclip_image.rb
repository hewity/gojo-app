class PaperclipImage < ActiveRecord::Base
  has_attached_file :avatar, styles: {
    medium: "300x300>",
    small: "250x150",
    thumb: "100x100>"
    }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
