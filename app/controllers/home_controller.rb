class HomeController < ActionController::Base
  layout 'application'

  def index
    @situations = nil

    if current_user
      @situations = Situation.all
    end
  end
end
