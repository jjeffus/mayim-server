class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  # GET api/v1/users
  def index
    logger.info "User: #{current_user}"
    if current_user
      json_response(@users)
    else
      error = {'error': "You must be signed in to use this service."}
      render json: error
    end
  end

  # PUT api/v1/users/:id
  def update
    @user = User.find(params[:id])
    if @user and @user.id == current_user.id
      @user.update(user_params)
      ActionCable.server.broadcast 'appearance_channel', json_response(@user)
      json_response(@user)
    else
      error = {'error': "You do not have access to this resource."}
      render json: error
    end
  end

  private

    def user_params
      params.permit(:online, :avatar, :name, :email, :bio)
    end
end
