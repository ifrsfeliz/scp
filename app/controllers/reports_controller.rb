class ReportsController < ActionController::Base
  layout :resolve_layout

  before_action :authenticate_user!, except: [:deliver, :form_deliver]

  before_action :set_report, only: [:show, :edit, :update, :destroy, :form_deliver, :deliver]

  before_filter :verify_token_or_role, only: [:deliver, :form_deliver]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Relatório criado com sucesso.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Relatório atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Relatório destruido com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def form_deliver
  end

  def deliver
    @report.entregue = true
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to root_path, notice: 'O relatório foi enviado com sucesso!' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
    @last_report = @report.project.reports.last == @report
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:data_entrega, :atividades_desenvolvidas, :resultados_obtidos, :dificuldades_encontradas, :proximas_etapas, :conclusoes, :referencias, :notificacao_antecipada, :notificacao_no_dia, :notificacao_atrasada, :project_id)
  end

  # check if the user has access to this page or if has the token to edit this page
  def verify_token_or_role
    if (current_user && current_user.role?(:admin))
    elsif (params[:access_token] == @report.access_token)
      @access_by_token = true

      puts "**************** #{params[:access_token]}   -   #{@report.access_token} "
    else
      puts "**************** #{params[:access_token]}   -   #{@report.access_token} "
      redirect_to root_path, notice: 'Você não tem acesso à essa página'
    end
  end
  def resolve_layout
    case action_name
    when "form_deliver"
      "report_deliver"
    else
      "application"
    end
  end
end
