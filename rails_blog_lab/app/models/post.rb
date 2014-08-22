class Post < ActiveRecord::Base
  has_many :comments
  has_many :feeds
  has_many :tags, :through => :feeds
end
