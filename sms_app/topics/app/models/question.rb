class Question < ActiveRecord::Base
  	attr_accessible :content, :title, :user_id
  	has_many :comments, :as => :commentable, :dependent => :destroy
  	belongs_to :user
end
