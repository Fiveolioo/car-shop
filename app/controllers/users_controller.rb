class UsersController < ApplicationController
  def show
  end
  
  private

  def user
    @user = current_user
  end
end