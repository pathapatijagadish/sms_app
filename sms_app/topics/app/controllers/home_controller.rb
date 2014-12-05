class HomeController < ApplicationController
  def index
  	arr = []
  	arr<<Question.last(3)
  	arr<<Problem.last(3)
  	arr<<Idea.last(3)
  	arr<<Praise.last(3)
  	arr=arr.flatten!
  	arr = arr.sort_by { |obj| obj.created_at }
    @sorted_coll = arr.reverse
  end

  def latest
  	arr = []
  	arr<<Question.last(3)
  	arr<<Problem.last(3)
  	arr<<Idea.last(3)
  	arr<<Praise.last(3)
  	arr=arr.flatten!
  	arr = arr.sort_by { |obj| obj.created_at }
    @sorted_coll = arr.reverse
  	respond_to do |format|
      format.js{
          
      }
    end    
  end
end
