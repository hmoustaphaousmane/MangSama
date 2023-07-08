class UsersController < ApplicationController
  # GET
  def show
    @user = User.find(params[:id])
  end
end
