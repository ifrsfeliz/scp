class ScholarshipTypesController < ApplicationController
  before_action :set_scholarship_type, only: [:show, :edit, :update, :destroy]

  # GET /scholarship_types
  # GET /scholarship_types.json
  def index
    @scholarship_types = ScholarshipType.all
  end

  # GET /scholarship_types/1
  # GET /scholarship_types/1.json
  def show
  end

  # GET /scholarship_types/new
  def new
    @scholarship_type = ScholarshipType.new
  end

  # GET /scholarship_types/1/edit
  def edit
  end

  # POST /scholarship_types
  # POST /scholarship_types.json
  def create
    @scholarship_type = ScholarshipType.new(scholarship_type_params)

    respond_to do |format|
      if @scholarship_type.save
        format.html { redirect_to @scholarship_type, notice: 'Tipo de Bolsa criado com sucesso.' }
        format.json { render :show, status: :created, location: @scholarship_type }
      else
        format.html { render :new }
        format.json { render json: @scholarship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarship_types/1
  # PATCH/PUT /scholarship_types/1.json
  def update
    respond_to do |format|
      if @scholarship_type.update(scholarship_type_params)
        format.html { redirect_to @scholarship_type, notice: 'Tipo de Bolsa atualizado com sucessor.' }
        format.json { render :show, status: :ok, location: @scholarship_type }
      else
        format.html { render :edit }
        format.json { render json: @scholarship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarship_types/1
  # DELETE /scholarship_types/1.json
  def destroy
    @scholarship_type.destroy
    respond_to do |format|
      format.html { redirect_to scholarship_types_url, notice: 'Tipo de Bolsa destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship_type
      @scholarship_type = ScholarshipType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholarship_type_params
      params.require(:scholarship_type).permit(:nome)
    end
end
