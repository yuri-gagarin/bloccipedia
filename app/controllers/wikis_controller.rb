class WikisController < ApplicationController

  require 'redcarpet'

  before_action :authenticate_user!

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = current_user.wikis.build
  end

  def create

    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      flash[:notice] = 'Your Wiki was saved'
      redirect_to(wikis_path)
    else
      flash[:alert] = 'There was a problem saving your Wiki. Try again!'
      render(:new)
    end

  end

  def edit

    @wiki = Wiki.find(params[:id])
    authorize(@wiki)

  end

  def update

    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    authorize(@wiki)

    if @wiki.save
      flash[:notice] = 'Your wiki was updated'
      redirect_to(wiki_path(@wiki))
    else
      flash.now[:alert] = 'Error in updating your wiki'
      render(:edit)
    end

  end

  def delete

    @wiki =  Wiki.find(params[:id])

  end

  def destroy

    @wiki = Wiki.find(params[:id])
    authorize(@wiki)
    if @wiki.destroy
      flash[:notice] = 'Your wiki has been deleted'
      redirect_to(wikis_path)
    else
      flash.now[:alert] = 'Error in deleting the wiki please try again'
      render(:show)
    end
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :category, :private)
  end

end
