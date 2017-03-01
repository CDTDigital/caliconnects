class WelcomeController < ApplicationController
  def index
  end

  def preparedness
    if params[:id]
      alert = Alert.find(params[:id])

      alert.update(opened_total: (alert.opened_total += 1))
    end
  end
end
