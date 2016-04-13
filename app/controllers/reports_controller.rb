class ReportsController < ActionController::Base

  layout :resolve_layout

  before_action :authenticate_user!, except: [:deliver, :form_deliver]
  before_action :set_report, only: [:show, :edit, :update, :destroy, :form_deliver, :deliver, :reformulate, :approve]
  before_filter :verify_token_or_role, only: [:deliver, :form_deliver]

  def index
    @reports = Report.where('entregue = ? AND avaliacao = ? OR avaliacao = ?', true, 'Aguardando Avaliação', 'à Reformular')
  end

  def show
  end

  def approve
    if current_user.role? :admin
      @report.avaliacao = "Aprovado"

      @report.save
      ReportMailer.approved_report(@report).deliver_later
      redirect_to reports_path, notice: 'Relatório aprovado com sucesso!'
    else
      redirect_to root_path, notice: 'Você não tem permissão de executar essa ação.'
    end
  end

  def reformulate
    if current_user.role? :admin
      @report.avaliacao = 'à Reformular'
      @report.entregue = false

      @report.update(report_params)
      ReportMailer.reformulate_report(@report).deliver_later

      redirect_to reports_path, notice: 'Pedido de reformulação enviado com sucesso!'
    else
      redirect_to root_path, notice: 'Você não tem permissão de executar essa ação.'
    end
  end

  def form_deliver
    if @report.entregue?
      redirect_to root_path, notice: 'Esse formulário já foi enviado, caso necessite fazer alterações solicite a reabertura do relatório.'
    end
  end

  def deliver
    @report.entregue = true
    @report.avaliacao = 'Aguardando Avaliação'

    @report.update(report_params)

    if params[:report_attachments]
      params[:report_attachments].each { |f|
        @report.report_attachments.create(file: f)
      }
    end

    redirect_to root_path, notice: 'Relatório enviado com sucesso!'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
    @last_report = @report.project.reports.last == @report
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:data_entrega, :atividades_desenvolvidas, :resultados_obtidos, :dificuldades_encontradas, :proximas_etapas, :conclusoes, :referencias, :notificacao_antecipada, :notificacao_no_dia, :notificacao_atrasada, :project_id, :observacao_reformular)
  end

  # check if the user has access to this page or if has the token to edit this page
  def verify_token_or_role
    if (params[:access_token] == @report.access_token)
      @access_by_token = true
    else
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
