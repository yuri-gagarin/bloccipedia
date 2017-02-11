class CollaboratorsController < ApplicationController

  before_action :authenticate_user!

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new
    @user = current_user
    authorize(@collaborator)
  end


  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new(collaborator_params)
    authorize(@collaborator)

    if @collaborator.save
      flash[:notice] = "Collaborator was successfully saved"
      redirect_to(edit_wiki_path(@wiki.id))
    else
      flash[:alert] = "Could not save collaborator"
      redirect_to(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    authorize(@collaborator)

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.email} was successfully removed."
      redirect_to(@wiki)
    else
      flash[:error] = "Could not remove the collaborator"
      redirect_to(@wiki)
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end


end
