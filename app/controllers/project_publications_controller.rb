class ProjectPublicationsController < ApplicationController
  load_and_authorize_resource

  before_action :set_publication, only: [:destroy]

  def destroy
    @publication.destroy
    redirect_to :back, notice: 'Publicação deletada com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = ProjectPublication.find(params[:id])
    end
end
