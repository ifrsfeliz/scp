class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save

        if params[:attachments]
          params[:attachments].each { |f|
            @project.project_attachments.create(file: f)
          }
        end

        if params[:publications]
          params[:publications].each { |f|
            @project.project_publications.create(file: f)
          }
        end

        format.html { redirect_to @project, notice: 'Projeto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)

        if params[:attachments]
          params[:attachments].each { |f|
            @project.project_attachments.create(file: f)
          }
        end

        if params[:publications]
          params[:publications].each { |f|
            @project.project_publications.create(file: f)
          }
        end

        format.html { redirect_to @project, notice: 'Projeto foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Projeto foi destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  # GET /projects/per_research_group
  def per_research_group
    research_groups = ResearchGroup.all

    @cont = []

    research_groups.each do |rg|
      cont_temp = 0
      rg.research_lines.each do |rl|
        cont_temp += rl.projects.count
      end

      @cont.push({label: rg.nome, y: cont_temp})
    end

    respond_to do |format|
      format.json {render :per_research_group, status: :ok}
    end

  end

  # GET /projects/per_year.json
  def per_year
    ano_inicial = Project.order('data_inicio asc').first.data_inicio.year
    ano_final = Project.order('data_fim desc').first.data_fim.year

    anos_range = ano_inicial..ano_final

    @cont = []

    projects = Project.all

    anos_range.each do |a|
      cont_temp = 0
      projects.each do |p|
        if p.data_inicio.year <= a && p.data_fim.year >= a
          cont_temp += 1
        end
      end

      @cont.push({label: a, y: cont_temp})
    end

    respond_to do |format|
      format.json {render :per_year, status: :ok}
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:nome, :researcher_id, :data_inicio, :data_fim, :numero_suap, :nome_edital, :link_cnpq, :ultima_verificacao, :auxilio_aipct, :valor_aipct, :research_line_id, :situation_id, :scholarship_type_id,
                                      reports_attributes: [:id, :periodo_desenvolvimento_inicio, :periodo_desenvolvimento_fim, :_destroy],
                                      member_students_attributes: [:id, :student_id, :_destroy, :tipo_vinculo, :data_inicio, :data_fim],
                                      member_researchers_attributes: [:id, :researcher_id, :_destroy])
    end
end
