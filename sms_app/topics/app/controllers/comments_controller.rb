class CommentsController < ApplicationController

  def create
    #binding.pry
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save 
        if @comment.commentable_type == "Question"
          @question = Question.find(params[:question_id])
          format.js {
            flash[:notice] = 'Comment was successfully created.'
          }
        elsif @comment.commentable_type == "Idea"
          @idea = Idea.find(params[:idea_id])
          format.js {
          flash[:notice] = 'Comment was successfully created.'
          }
        elsif @comment.commentable_type == "Problem"
          @problem = Problem.find(params[:problem_id])
          format.js {
          flash[:notice] = 'Comment was successfully created.'
          }
        elsif @comment.commentable_type == "Praise"
          @praise = Praise.find(params[:praise_id])
          format.js {
          flash[:notice] = 'Comment was successfully created.'
          }
        else                   
          format.js{          
            flash[:error] = @comment.errors.full_messages.map{|x| "<span>#{x}</span>" }.join(' ')                  
          } 
        end
      end      
    end
  end


  def good_reply
    @comment=Comment.find(params[:id])
    if @comment.commentable_type == "Question"
      @comment.update_attribute("count", @comment.count.to_i + 1)
      redirect_to questions_url 
    elsif @comment.commentable_type == "Idea"
      @comment.update_attribute("count", @comment.count.to_i + 1)
      redirect_to ideas_url 
    elsif @comment.commentable_type == "Problem"
      @comment.update_attribute("count", @comment.count.to_i + 1)
      redirect_to problems_url 
    else
      @comment.update_attribute("count", @comment.count.to_i + 1)
      redirect_to praises_url 
    end
  end
  	
  def destroy
    @comment.destroy
    respond_to do |format|      
      format.js { 
        flash[:notice] = 'Comment was successfully deleted.'
      }
    end
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end

