class SessionsController < ApplicationController

def create
    # byebug
    user = User.find_by(username: params[:username])
    # if user.valid?
    session[:user_id] = user.id
    render json: user#, status: :ok
    
rescue ActiveRecord::RecordInvalid => invalid
    render json: invalid.record.error.full_messages

end

def destroy
    session.delete :user_id
    head :no_content
end

end
