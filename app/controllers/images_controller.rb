# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
end
