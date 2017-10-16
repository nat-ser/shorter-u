class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protect_from_forgery with: :exception

  private
  def render_404(exception = nil)
    if exception
        logger.error "Rendering 404: #{exception.message}"
    end
    render file:  "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
