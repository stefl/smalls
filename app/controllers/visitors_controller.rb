class VisitorsController < ApplicationController

  def index
    @briefs = Brief.active.where(:is_public => true)
    @private_briefs = Brief.active.where(:is_public => false)
  end

end
