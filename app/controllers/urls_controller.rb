class UrlsController < ApplicationController
  before_action :full_url_address, only: [:show]

  def index
    @url = Url.new
  end

  def create
    @url = Url.find_or_initialize_by(url_params)
    respond_to do |format|
      if @url.save
        format.html { redirect_to root_url, notice: 'url link created successfully'}
        format.js { }
        format.json { }
      else
        flash[:error] = @url.error.full_messages
        render :index
      end
    end
  end

  def show
    redirect_to full_url_address
    url.increment_visit_count
  end

  private

  def url_params
    params.require(:url).permit(:full_address)
  end

  def full_url_address
    url.full_address
  end

  def url
    @url ||= Url.from_base_translation(params)
  end
end
