module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
  end

  private

  def handle_validation_error(e)
    redirect_back fallback_location: root_path, alert: e.message
  end

  def handle_record_not_found(e)
    redirect_back fallback_location: root_path, alert: e.message
  end
end
