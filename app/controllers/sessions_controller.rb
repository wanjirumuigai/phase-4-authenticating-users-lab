class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

def create
  user = User.find_by(username: params[:username])

  session[:user_id] = user.id

  render json: user
 end

 def destroy
   session.delete :user_id
   head :no_content
 end

  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end

end
