class BookCommentsController < ApplicationController
  def create
    @book_comment = current_user.book_comments.new(comment_params)
    if @book_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    BookComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:book_comment).permit(:comment_content,:book_id)
  end
end
