class UsersController < ApplicationController
 def show
  @user = User.find(params[:id]) 
  @blogs = Blog.all
 end
end
