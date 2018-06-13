class Article < ActiveRecord::Base
  #Here user is singular since it is a one to many relationship and many articles belong to one user
  belongs_to :user
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true
end
