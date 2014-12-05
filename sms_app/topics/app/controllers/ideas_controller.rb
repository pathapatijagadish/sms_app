class IdeasController < ApplicationController

  	def index
	    @ideas = Idea.all
	    respond_to do |format|
     		format.js
    	end
  	end

	def new
	    @idea = Idea.new
	end

  	def create  		
	    @idea = Idea.new(params[:idea])
		respond_to do |format|
			format.html{
			    if @idea.save
			  		flash[:notice]="Idea created scuccessfully"
				    redirect_to ideas_url
				else
			  		flash[:error]="Idea not created"
				    render "new"
				end
			}
     		format.js{
     			if @idea.save
     				#Any message 
     			else
     				#Error message 
     			end
     			@ideas = Idea.all
     		}
    	end
  	end

  	def show
    	@idea = Idea.find(params[:id])
  	end

  	def edit
    	@idea = Idea.find(params[:id])
  	end

  	def update
	    @idea = Idea.find(params[:id])

	    if @idea.update_attributes(params[:idea])
		    flash[:notice]="Idea updated scuccessfully"
			redirect_to action:"index"
	    else
		    flash[:error]="Idea not updated"
			render "edit"
	    end
  	end

  	def destroy
	    @idea = Idea.find(params[:id])

	    if @idea.destroy
			flash[:notice]="Idea deleted scuccessfully"
		else
			flash[:error]="Idea not deleted"
		end
		redirect_to ideas_url
  	end
end
