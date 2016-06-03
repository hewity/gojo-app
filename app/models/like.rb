class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipebox

  validates_uniqueness_of :user, scope: :recipebox
end
