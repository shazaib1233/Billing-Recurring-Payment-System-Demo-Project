module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
  end

  private

  def handle_validation_error
    render plain: 'Custom InvalidRecord Error'
  end

  def handle_record_not_found
    render plain: 'Custom RecordNotFound Error'
  end
end
