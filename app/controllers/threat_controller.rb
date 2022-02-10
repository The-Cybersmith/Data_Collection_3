class ThreatController < ApplicationController
  # Necessary to prevent browser caching from making it all
  skip_before_action :verify_authenticity_token
  # This needs to show all of the threats.
  def show
    @threats = Threat.all
  end

  def create
    if session[:step].nil?
      session[:step] = Globals::ModelConstraints::Steps.first
      session[:values] = Hash.new
    end
    @step = session[:step]
    @values = session[:values]
  end
  
  # This will allow users to restart the submission process at any time.
  def reset
    session[:step] = Globals::ModelConstraints::Steps.first
    session[:values] = Hash.new
    redirect_to report_path and return
  end
  
  # This will allow submission of individual data, then revert to create.
  def progress
    if session[:step] == Globals::ModelConstraints::Steps.last
      Threat.create(name: session[:values]['name'], email: session[:values]['contact'], severity: session[:values]['severity'])
      session[:step] = nil
      redirect_to threats_path and return
    end
    if Threat.check?(session[:step],params[:threat][:input])
      session[:values][session[:step]] = params[:threat][:input]
      session[:step] = Globals::ModelConstraints::Steps[Globals::ModelConstraints::Steps.index(session[:step])+1]
    end
    redirect_to report_path and return
  end
end
