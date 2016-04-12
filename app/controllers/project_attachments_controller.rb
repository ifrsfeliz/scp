class ProjectAttachmentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_attachment, only: [:destroy]

  def destroy
    @attachment.destroy
    redirect_to :back, notice: 'Anexo deletado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = ProjectAttachment.find(params[:id])
    end
end
