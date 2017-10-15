class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
  end

  private

  def url_params
    params.require(:url).permit(:full_address)
  end
end
