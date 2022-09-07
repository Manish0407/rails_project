class UsersController < ApplicationController
  def index
    @users =  User.where(type: "Student")
  end  

  def show
  end
end
