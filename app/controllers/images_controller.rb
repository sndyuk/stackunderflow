class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def cached_image_url
    render text: Refile.file_url(Refile.cache.get(params[:ref]), filename: params[:filename])
  end
end