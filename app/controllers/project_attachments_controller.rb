class ProjectAttachmentsController < ApplicationController
  before_action :set_attachment, only: [:destroy]

  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Anexo deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = ProjectAttachment.find(params[:id])
    end
end
