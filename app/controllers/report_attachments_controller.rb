class ReportAttachmentsController < ApplicationController
  before_action :set_attachment, only: [:destroy]

  def destroy
    @attachment.destroy
    redirect_to :back, notice: 'Anexo deletado com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = ReportAttachment.find(params[:id])
  end
end
