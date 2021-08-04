class UsersController < ApplicationController
  before_action :baria_user, only: [:edit]

  def show
    @room = Room.new
    @book = Book.new
    @user_books = Book.where(user_id:params[:id]).includes(:favorited_users).sort{|a,b| b.favorited_users.size <=> a.favorited_users.size}
    # @user_books = Book.includes(:favorited_users).sort{|a,b| b.favorited_users.size <=> a.favorited_users.size}　
    #上記を追記すると、Book.allが呼び出されてしまう。なので、user.bookを呼び出してから、並び替えの記述をする。
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @room_id = cu.room_id
          end
        end
      end
      unless @isRoom 
         @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render"edit"
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def baria_user
    unless User.find(params[:id]).id == current_user.id
    # if User.find(params[:id]).id != current_user.id
    redirect_to user_path(current_user)
    end
  end
end
