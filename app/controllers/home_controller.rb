class HomeController < ActionController::Base
  layout 'application'

  before_filter :load_settings
  
  def index
    @situations = nil

    if current_user
      @situations = Situation.all
    end
  end
  
  def load_settings
    @config = YAML.load_file('config/settings.yml')[Rails.env];
  end
end
