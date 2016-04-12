class ProjectsController < ApplicationController
  load_and_authorize_resource

  skip_authorize_resource :only => [:per_year, :per_research_group]
  skip_before_filter :authenticate_user!, only: [:per_year, :per_research_group]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

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

      redirect_to @project, notice: 'Projeto criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
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

      redirect_to @project, notice: 'Projeto atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy

    redirect_to projects_path, notice: 'Projeto removido com sucesso.'
  end

  def delete_edital
    @project = Project.find(params[:project_id])
    @project.edital = nil

    @project.save

    redirect_to @project, notice: 'Edital deletado com sucesso.'
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
      params.require(:project).permit(:nome, :researcher_id, :data_inicio, :data_fim, :numero_suap, :nome_edital, :link_cnpq, :ultima_verificacao, :auxilio_aipct, :valor_aipct, :research_line_id, :situation_id, :scholarship_type_id, :edital,
                                      reports_attributes: [:id, :periodo_desenvolvimento_inicio, :periodo_desenvolvimento_fim, :_destroy],
                                      member_students_attributes: [:id, :student_id, :_destroy, :tipo_vinculo, :data_inicio, :data_fim, :relatorio_entregue],
                                      member_researchers_attributes: [:id, :researcher_id, :_destroy])
    end
end
