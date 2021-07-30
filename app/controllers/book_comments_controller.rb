class BookCommentsController < ApplicationController
  def create
    @book_comment = current_user.book_comments.new(comment_params)
    respond_to do |format|
      if @book_comment.save
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      else
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  def destroy
    book_comment = BookComment.find_by(id: params[:id],book_id: params[:book_id])
    if book_comment.user == current_user
      book_comment.destroy
      redirect_back(fallback_location: root_path)
    else
      rendirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:book_comment).permit(:comment_content,:book_id)
  end
end
