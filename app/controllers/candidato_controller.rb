class CandidatoController < ApplicationController

  layout false

  def candidato
  	@filtroCand = []
  	@filtroInst = []
    if session[:filtro_instituicao]
      @filtroInst = session[:filtro_instituicao].split(/,/)
    end
  	@handles = UserInfo.where(:handle.ne => session[:handle], organization: { '$in': @filtroInst })
  	if session[:filtro_candidato] and session[:filtro_candidato] != ""
  		@filtroCand = session[:filtro_candidato].split(/,/)
  	else
  		@handles.map(&:handle).each do |cand|
  			@filtroCand.push(cand)
  		end
  	end
    respond_to do |format|
      	format.html
      	format.json { render json: @handles.where(handle: /#{Regexp.escape(params[:q])}/i ) }
    end
  end

  def filtroCandidato
    session[:filtro_candidato] = params[:candidatos]
    respond_to do |format|
      format.html {
        redirect_to "/candidato", status: :moved_permanently
      }
    end
  end

end
