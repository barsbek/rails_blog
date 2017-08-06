class ArticlesController < ApplicationController
  def index
  end

  def new
  end

  def create
    render json: params[:article].inspect
  end
end
