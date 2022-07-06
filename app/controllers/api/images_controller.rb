module Api
  class ImagesController < ApplicationController
    def update
      @image = Image.find params[:id]

      @image.update! title: params[:image][:title].strip

      head :ok
    end
  end
end