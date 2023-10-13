class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_books

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

  def search_books
    if params[:q].present?
      @q = Book.ransack(params[:q])
      @searched_books = @q.result
    else 
      @q = Book.ransack(params[:q])
      @searched_books = []
    end
  end

end