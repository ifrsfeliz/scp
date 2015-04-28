class ResearchersController < ApplicationController
  load_and_authorize_resource

  before_action :set_researcher, only: [:show, :edit, :update, :destroy]

  # GET /researchers
  # GET /researchers.json
  def index
    @q = Researcher.ransack(params[:q])
    @researchers = @q.result(distinct: true)
  end

  # GET /researchers/1
  # GET /researchers/1.json
  def show
  end

  # GET /researchers/new
  def new
    @researcher = Researcher.new
  end

  # GET /researchers/1/edit
  def edit
  end

  # POST /researchers
  # POST /researchers.json
  def create
    @researcher = Researcher.new(researcher_params)

    respond_to do |format|
      if @researcher.save

        if params[:files]
          params[:files].each { |f|
            @researcher.documents.create(file: f)
          }
        end

        format.html { redirect_to @researcher, notice: 'Pesquisador foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @researcher }
      else
        format.html { render :new }
        format.json { render json: @researcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /researchers/1
  # PATCH/PUT /researchers/1.json
  def update
    respond_to do |format|
      if @researcher.update(researcher_params)

        if params[:files]
          params[:files].each { |f|
            @researcher.documents.create(file: f)
          }
        end

        format.html { redirect_to @researcher, notice: 'Pesquisador foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @researcher }
      else
        format.html { render :edit }
        format.json { render json: @researcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researchers/1
  # DELETE /researchers/1.json
  def destroy
    @researcher.destroy
    respond_to do |format|
      format.html { redirect_to researchers_url, notice: 'Pesquisador foi destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_researcher
      @researcher = Researcher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def researcher_params
      params.require(:researcher).permit(:nome, :cpf, :rg, :email, :link_lattes, :telefone, :celular)
    end
end
