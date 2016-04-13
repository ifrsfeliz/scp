class DocumentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_document, only: [:destroy]

  def destroy
    @document.destroy
    redirect_to :back, notice: 'Documento removido com sucesso.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end
end
