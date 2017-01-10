class CategoriesController < ApplicationController
  def index
    @catalog = Category.last.self_and_siblings
  end

  def show
    params[:per_page] ? per_page=params[:per_page].to_i : per_page = 20
    params[:page] ? page=params[:page].to_i : page=1
    params[:sort] ? sort=params[:sort] : sort="По умолчанию"
    @sort = sort
    @page = page
    @per_page = per_page
    @category = Category.find(params[:id])
    @catalog = Category.all

    #@page_count = @products_in["count"]/@per_page
    #if @products_in["count"] % @per_page != 0
    #  @page_count += 1
    #end
    #@products = Product.where(category_id: params[:id])
  end
end
