class StylesController < ApplicationController

  before_action :authenticate_user!

  def index
    @styles = Style.all 
     respond_to do |format|
      format.html { render :index}
      format.json { render json: @styles}
    end
  end


  def create
    @style = Style.create(name: params["name"])
    if @style.save
       render json: @style, status: 201  
    else  
      redirect_to :index
    end
  end

   def destroy
    @style = Style.find_by(id: params[:id])
    @style.destroy
     render json: {}, status: 204    
  end

end