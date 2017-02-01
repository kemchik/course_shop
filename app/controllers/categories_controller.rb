class CategoriesController < ApplicationController
  before_action :load_category, only: %i(edit update destroy)

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to :home_index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to :home_index
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to :home_index
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def load_category
    @category ||= Category.find(params[:id])
  end
end
