# == Schema Information
#
# Table name: member_students
#
#  id                               :integer          not null, primary key
#  project_id                       :integer
#  student_id                       :integer
#  tipo_vinculo                     :string(255)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  data_inicio                      :date
#  data_fim                         :date
#  relatorio_entregue               :boolean
#  notificacao_antecipada           :boolean
#  notificacao_no_dia               :boolean
#  notificacao_atrasada             :boolean
#  ultima_data_notificacao_atrasada :date
#

class MemberStudent < ActiveRecord::Base
  
  # Associations
  belongs_to :project
  belongs_to :student

  # Validations
  validates_presence_of :student, :tipo_vinculo, :data_inicio, :data_fim


  def self.report_request_notification
    member_students = MemberStudent.where(relatorio_entregue: [nil, false])

    today = Date.parse('09-04-2015')
    #today = Date.parse('25-03-2015')
    #today = Date.today

    member_students.each do |ms|
        if (ms.notificacao_antecipada.nil? && ms.data_fim - 2 <= today) # 15 days early or next the deliver date
          mail = MemberStudentMailer.early_report_notification(ms).deliver

          if mail
            ms.notificacao_antecipada = true
            ms.save
          end

        elsif (ms.notificacao_no_dia.nil? && ms.data_fim <= today) # today notification
          mail = MemberStudentMailer.on_day_report_notification(ms).deliver

          if mail
            ms.notificacao_no_dia = true
            ms.save
          end

      elsif (ms.notificacao_atrasada.nil? && ms.data_fim + 2 == today)
        mail = MemberStudentMailer.first_delayed_report_notification(ms).deliver

        if mail
          ms.notificacao_atrasada = true
          ms.ultima_data_notificacao_atrasada = today
          ms.save
        end

      # notificacao_atrasada significa que já foi entregue
      elsif (ms.notificacao_atrasada == true && ms.ultima_data_notificacao_atrasada + 2 == today)
        mail = MemberStudentMailer.others_delayed_report_notification(ms).deliver

        if mail
          ms.ultima_data_notificacao_atrasada = today
          ms.save
        end
      end
    end
  end

end
