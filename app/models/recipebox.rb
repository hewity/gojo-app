class Recipebox < ActiveRecord::Base
  belongs_to :user
  has_many :likes
validates :user_id, presence: true
validates :name, presence: true, length: {minimum: 5, maximum: 100 }
validates :summary, presence: true, length: {minimum: 10, maximum: 150 }
validates :description, presence: true, length: {minimum:20, maximum: 500 }
# default_scope -> { oreder(updated_at: :disc)}
# to show first the latest update

def thumbs_up_total
  self.likes.where(like: true).size
end

def thumbs_down_total
  self.likes.where(like: false).size
end

end
