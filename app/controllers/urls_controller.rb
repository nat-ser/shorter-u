# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    @url = Url.new
    @top_urls = Url.order("visit_count DESC").limit(100)
  end

  def create
    respond_to :json
    @url = Url.find_or_initialize_by(url_params)
    if @url.save
      @friendly_url = friendly_url(@url)
      render json: { url: @friendly_url }
    else
      render json: { error: @url.errors.full_messages.first }, status: 422
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
    @url ||= Url.find_by_friendly_id(params[:friendly_id])
  end
end
