class BookmarksController < ApplicationController

  def new
    # @list = List.find(params[list_id])
    #Revisar bien el porqué de lo anterior
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
    redirect_to bookmark_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
