class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end
  
  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to bookmark_path
  end
end
