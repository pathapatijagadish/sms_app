class ProblemsController < ApplicationController

	def index
  	@problems = Problem.all
	end

	def new
    	@problem = Problem.new
	end

 def create
    @problem = Problem.new(params[:problem])
    respond_to do |format|
      format.html{
        if @problem.save
          flash[:notice]="problem created scuccessfully"
          redirect_to problems_url
        else
          flash[:error]="problem not created"
           render "new"
        end
      }
      format.js{
        if @problem.save
          flash[:notice]="problem created scuccessfully"
        else
          flash[:error]="problem not created"
        end
        @problems = Problem.all
      }
    end    
  end

	def show
    	@problem = Problem.find(params[:id])
	end

	
	def edit
    	@problem = Problem.find(params[:id])
  	end

    def update
    	@problem = Problem.find(params[:id])

      	if @problem.update_attributes(params[:problem])
       		flash[:notice] = 'Problem was successfully updated.'
       		redirect_to problems_url
      	else
      		flash[:error] = "problem was not updated"
        	render "edit"
    	end
  	end

  	def destroy
	    @problem = Problem.find(params[:id])
	    if @problem.destroy
	    	flash[:notice] = "problem is deleted successfully."
	    else
	      flash[:error] = "problem in not deleted."
	    end
	    redirect_to problems_url
  	end
end

