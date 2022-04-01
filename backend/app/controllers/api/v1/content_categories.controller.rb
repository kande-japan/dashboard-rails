class Api.v1::ContentCategoriesController < ApplicationController
  skip_before_action :authenticate

  def create
    @new_content_category = ContentCategory.new(categories_params, slack_user_params)
    @new_content_category.save
  end

  def update
    @new_content_categor.update(categories_params, slack_user_params)
  end

  private

  def categories_params
    params.require(:category).permit(:category_id)
  end

  def slack_user_params
    params.require(:slack_user).permit(:id)
  end
end
