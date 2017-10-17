class UrlsController < ApplicationController
  before_action :full_url_address, only: [:show]

  def index
    @url = Url.new
  end

  def create
    respond_to do |format|
      @url = Url.find_or_initialize_by(url_params)
      if @url.save
        @friendly_url = @url.base_translation_to_friendly_path
        # need to convert to json here b/c friendly_url is a string not an object :\ ugly
        format.json { render json: @friendly_url.to_json }
        format.html { redirect_to urls_url }
      else
        format.json { render json: { errors: @url.errors.full_messages }, status: 422 }
        format.html { render :index }
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
