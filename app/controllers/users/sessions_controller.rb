class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: "you are log in",
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    if resource && resource.persisted?
      log_out_success
    else
      log_out_success
    end
  end

  def log_out_success
    render json: {
      message: "you are logout"
    }, status: :ok
  end

end
