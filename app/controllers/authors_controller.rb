class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all
    render json: authors, include: %w[profile posts posts.tags]
  end

  def show
    author = Author.find(params[:id])
    render json: author, include: %w[profile posts posts.tags]
  end

  private

  def render_not_found_response
    render json: { error: 'Author not found' }, status: :not_found
  end
end
