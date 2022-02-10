class ThreatController < ApplicationController
  # Necessary to prevent browser caching from making it all
  skip_before_action :verify_authenticity_token
  # This needs to show all of the threats.
  def show
    @threats = Threat.all
  end

  # This will keep track of the current stage in the creation
  # process. 
  def create
    session[:step] = Globals::ModelConstraints::Steps.first if session[:step].nil?
    @step = session[:step]
  end
  
  # This will allow submission of individual data, then revert to create.
  def progress
    if session[:step] == Globals::ModelConstraints::Steps.last
      # Create the new record, reset creation, and go to display.
      session[:step] = nil
      redirect_to threats_path and return
    end
    session[:step] = Globals::ModelConstraints::Steps[Globals::ModelConstraints::Steps.index(session[:step])+1]
    # Add the current data then present the next view
    redirect_to report_path and return
  end
end
