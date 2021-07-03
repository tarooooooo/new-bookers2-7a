class BooksController < ApplicationController

  def new

  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
   @book = Book.new
   @books = Book.all
  end

  def show

  end

  def edit
    @model_class_name = ModelClassName.find(params[:id])
  end

  def update

  end

  def destroy
  end
   private
   def book_params
     params.require(:book).permit(:title,:opinion)
   end
end
