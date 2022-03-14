# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def session
    @user = User.find_by email: session_params[:email]

    if @user&.authenticate session_params[:password]
      render json: ActiveModelSerializers::SerializableResource
        .new(@user, serializer: UserSerializer)
        .as_json
        .merge(issue_token)

    else
      render json: { error: { messages: ['mistake email or password'] } }, status: :unauthorized
    end
  end

  def refresh
    payload, = Jwt::TokenDecryptor.decrypt params[:refresh_token]
    raise AuthenticationError unless payload[:exp] < Time.now.to_i

    @user = User.find(payload[:aud])
    render json: ActiveModelSerializers::SerializableResource
      .new(@user, serializer: UserSerializer)
      .as_json
      .merge(issue_token)
  end

  private

  def session_params
    params
      .require(:session)
      .permit(:email, :password)
  end

  def issue_token
    {
      token: Jwt::TokenProvider.issue(
        iss: :kande_inc,
        aud: @user.id,
        exp: Time.current.to_i + 1.hour.to_i # 1hで失効
      ),
      refresh_token: Jwt::TokenProvider.issue(
        iss: :kande_inc,
        aud: @user.id,
        exp: Time.current.to_i + 1.year.to_i # 1 year で失効
      )
    }
  end
end
