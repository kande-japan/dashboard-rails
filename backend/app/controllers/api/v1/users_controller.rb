class Api::V1::UsersController < ApplicationController
  wrap_parameters :user, include: %i[name email password]

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def create
    @user_registration_form = UserRegistrationForm.new(user_registration_form_params)
    if @user_registration_form.save
      render json: { message: 'Successfully created' }, status: :created
    else
      render json: { message: @user_registration_form.errors }, status: :not_acceptable
    end
  end

  private

  def user_registration_form_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end
