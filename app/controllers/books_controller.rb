class BooksController < ApplicationController

 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
   @user = current_user
   @book = Book.new
   @books = Book.all
   
  end

  def show
    @book = Book.new
    @user_book = Book.find(params[:id])
    @user = @user_book.user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_update_params)
    redirect_to book_path(@book.id)
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

   def book_params
     params.require(:book).permit(:title,:opinion)
   end
    def book_update_params
     params.require(:book).permit(:title,:opinion)
   end
end
