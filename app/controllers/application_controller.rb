class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :instantiate_post
  before_action :instantiate_comment

  def instantiate_post
    @post = Post.new
  end

  def instantiate_comment
    @comment = Comment.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name gender date_of_birth avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name gender date_of_birth avatar])
  end
end
