class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_not_found_response(exception)
	respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.json { render json: { message: 'Page not found' }, status: :not_found }
	end
  end
end
