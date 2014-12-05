class PraisesController < ApplicationController

  def index
    @praises = Praise.all
    respond_to do |format|
      format.js
    end
  end

  def new
    @praise = Praise.new
  end

  def create
    @praise = Praise.new(params[:praise])
    respond_to do |format|
      format.html{
        if @praise.save
          flash[:notice]="Praise created scuccessfully"
          redirect_to praises_url
        else
          flash[:error]="Praise not created"
           render "new"
        end
      }
      format.js{
        if @praise.save
          flash[:notice]="Praise created scuccessfully"
        else
          lash[:error]="praise not created" 
        end
        @praises = Praise.all
      }
    end    
  end

  def show
    @praise = Praise.find(params[:id])
  end
  
  def edit
    @praise = Praise.find(params[:id])
  end

  def update
    @praise = Praise.find(params[:id])

    if @praise.update_attributes(params[:praise])
      flash[:notice] = 'Praise was successfully updated.'
      redirect_to praises_url
    else
      flash[:error] = "Praise was not updated"
      render "edit"
    end
  end

  def destroy
    @praise = Praise.find(params[:id])
    
    if @praise.destroy
      flash[:notice] = "Praise deleted successfully"
    else
      flash[:error] = "Praise not deleted"
    end
    redirect_to praises_url
  end
  
end

