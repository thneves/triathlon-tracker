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
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user,
        logged_in: true,
      }
    else
      render json: {
        status: 422,
        error: 'Invalid data, try again!',
        logged_in: false,
      }
    end
  end
end
