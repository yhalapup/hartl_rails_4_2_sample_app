class UsersController < ApplicationController

  def create
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
