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
    render json: @style, status: 201    
  end

   def destroy
    @style.destroy
    
  end

  private

  def style_params
    params.require(:style).permit(:name, :id)
  end

end