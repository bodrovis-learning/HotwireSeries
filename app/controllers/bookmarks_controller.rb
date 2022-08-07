# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :set_folder!

  def new
    @bookmark = @folder.bookmarks.build
  end

  def create
    success, @bookmark = Bookmarks::CreateService.call @folder, bookmark_params

    if success
      flash.now[:success] = 'Bookmark created!'
    else
      render :new
    end
  end

  private

  def set_folder!
    @folder = Folder.find params[:folder_id]
  end

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :folder_id)
  end
end
