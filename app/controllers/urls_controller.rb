class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    respond_to do |format|
      if @url.save
        format.html { }
        format.js { }
        format.json { }
      else
        format.html { }
        format.js { }
        format.json { }
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:full_address)
  end
end
