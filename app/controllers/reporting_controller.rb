class ReportingController < ApplicationController
  before_action :not_for_structure_sanitaire!, :not_for_system!
  before_action :not_for_structure_sanitaire!

  def index
  end

  def stat_by_sex
    @stats = current_structure_assurance.adherents.group(:sexe).count
    render :json => @stats, :layout => nil
  end

  def stat_by_situation_matrimoniale
    @stats = current_structure_assurance.adherents.group(:status_matrimonial).count
    render :json => @stats, :layout => nil
  end
end
