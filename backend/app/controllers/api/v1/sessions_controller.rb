# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def session
    @user = User.find_by email: session_params[:email]

    if @user&.authenticate session_params[:password]
      token = Jwt::TokenProvider.issue(
        iss: :kande_inc,
        aud: @user.id,
        exp: Time.now.to_i + 1.hour  # 1hで失効
      )

      render json: ActiveModelSerializers::SerializableResource
        .new(@user, serializer: UserSerializer)
        .as_json
        .merge({ token: token })

    else
      render json: { error: { messages: ['mistake email or password'] } }, status: :unauthorized
    end
  end

  private

  def session_params
    params
      .require(:session)
      .permit(:email, :password)
  end
end
