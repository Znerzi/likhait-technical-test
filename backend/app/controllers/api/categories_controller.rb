class Api::CategoriesController < ApplicationController

  # get all categories (sorted by name so it's cleaner to see)
  def index
    categories = Category.order(:name)
    render json: categories
  end

  # create new category
  # this allows user to add their own category
  def create
    # create new category from input
    category = Category.new(category_params)

    # check if save works
    if category.save
      # return the new category if successful
      render json: category, status: :created
    else
      # show error if something failed
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # only allow category name input (basic validation)
  def category_params
    params.require(:category).permit(:name)
  end

end