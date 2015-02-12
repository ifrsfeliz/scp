class DocumentsController < ApplicationController
  before_action :set_document, only: [:destroy]

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Documento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
    end
end
