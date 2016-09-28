class TimemarkersController < ApplicationController

  before_action :authenticate_user!

   def destroy
    @timemarker = Timemarker.find_by(id: params[:id])
    @timemarker.destroy
     render json: {}, status: 204    
  end

end