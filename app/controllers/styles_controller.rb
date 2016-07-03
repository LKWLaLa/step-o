class StylesController < ApplicationController

  before_action :authenticate_user!

  def index
    @styles = Style.all 
  end

  def new
    @style = Style.new()
  end

  def create
    @style = Style.create(style_params)
    if @style.save
      
    else
      render :new
    end
  end

   def destroy
    @style.destroy
    
  end

  private

  def style_params
    params.require(:style).permit(:name, :id)
  end

end