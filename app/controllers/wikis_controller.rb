class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wike.find(params[:id])
  end

  def destroy
  end
end
