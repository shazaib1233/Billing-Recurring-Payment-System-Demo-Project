module ApiResponse
  extend ActiveSupport::Concern

  def success_response(data)
    render json: {status: '200', data: data}
  end

  def failure_response(status, message)
    render_message(status, message)
  end

  def render_message(status, message)
    render json: {status: status, message: message}
  end
end
