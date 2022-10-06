class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all 
    render json: authors, include: ['profile','posts','posts.tags']
  end

  def show
    author = Author.find(params[:id])
    render json: author,  include: ['profile','posts','posts.tags'] #The includes part enables listing of the needed appended associations to the JSON where there is more than one level of appending.
  end

  private

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

end
