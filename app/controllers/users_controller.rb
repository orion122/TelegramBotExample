class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all

    @current_user = User.where(id: params[:id]).first
  end
end
