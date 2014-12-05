class Comment < ActiveRecord::Base
  	attr_accessible :content,:user_id,:commentable_id,:commentable_type,:parent_id
  	belongs_to :commentable, :polymorphic => true
  	belongs_to :user
  	has_many :replies , :class_name => 'Comment', :foreign_key => :parent_id
end
