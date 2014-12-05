class QuestionsController < ApplicationController

	def index
  	@questions = Question.all
	end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      format.html{
        if @question.save
          flash[:notice]="Question created scuccessfully"
          redirect_to questions_url
        else
          flash[:error]="Question not created"
           render "new"
        end
      }
      format.js{
        if @question.save
          #Any message 
        else
          #Error message 
        end
        @questions = Question.all
      }
    end    
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

	def update
  	@question = Question.find(params[:id])
    
    if @question.update_attributes(params[:question])
      flash[:notice]="Question updated scuccessfully"
		  redirect_to action:"index"
    else
      flash[:error]="Question not updated"
		  render "edit"
    end
  end

	def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
		  flash[:notice]="Question deleted scuccessfully"
	  else
		  flash[:error]="Question not deleted"
	  end
	  redirect_to questions_url
  end

end
