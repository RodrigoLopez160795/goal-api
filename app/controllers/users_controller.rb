class UsersController < ApplicationController
  # Done
  def show
    render json: current_user
  end
end
