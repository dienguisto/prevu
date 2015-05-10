class ReportingController < ApplicationController
  before_action :not_for_structure_sanitaire!, :not_for_system!
  before_action :not_for_structure_sanitaire!

  def index
  end
end
