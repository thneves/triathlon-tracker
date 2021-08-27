class RegistrationsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.create!(
      username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user
      @current_user_id = user.id
      session[:user_id] = user.id
      render json: {
        session: session,
        status: :created,
        user: user
      }
    else
      render json: {
        status: 500
      }
    end
  end
end
