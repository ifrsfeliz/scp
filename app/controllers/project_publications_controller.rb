class ProjectPublicationsController < ApplicationController
  load_and_authorize_resource

  before_action :set_publication, only: [:destroy]

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Anexo deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = ProjectPublication.find(params[:id])
    end
end
