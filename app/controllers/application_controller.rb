class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    raise JWT::DecodeError unless header
    
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    current_user = User.find(decoded[:user_id])
    
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError, NoMethodError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end
