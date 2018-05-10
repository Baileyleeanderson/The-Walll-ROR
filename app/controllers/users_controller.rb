class UsersController < ApplicationController

  def index
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :username))
    @user.save
    session[:id] = @user.id
    if @user.save
      flash[:notice] = "Welcome, #{@user.first_name}"
      redirect_to "/messages/#{session[:id]}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end 
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

  def logout
    session.clear
    puts "made it"
    redirect_to '/users/new'
  end

end
