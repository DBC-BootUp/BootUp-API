class SearchesController < ApplicationController
  def index
    searches = Search.all
    render json: searches
  end

  def create
   render json: Company.search_name(params[:searchInput])
   # render json: PgSearch.multisearch(params[:searchInput])
  end

  def show
    search = Search.find_by(params[:id])
    render json: search
  end

  def update
    search = Search.find_by(params[:id])
    if search.update(search_params)
      render json: search
    else
      render json: {errors: search.errors.full_messages}, statue: 422
    end
  end

  def destroy
    search = Search.find_by(id: params[:id])
    search.destroy
    render json: {message: "Search destroyed"}
  end

  private
  def search_params
    params.require(:search).permit(:name, :location, :website, :tech_field, :has_apprenticeship, :created_at, :updated_at)
  end
end
