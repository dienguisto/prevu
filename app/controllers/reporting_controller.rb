class ReportingController < ApplicationController
  before_action :not_for_structure_sanitaire!, :not_for_system!
  before_action :not_for_structure_sanitaire!

  def index
  end

  def stat_by_sex
    @stats = current_user.current_structure_assurance.adherents.group(:sexe).count
    render @stats.to_json
  end
end
