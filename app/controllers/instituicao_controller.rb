class InstituicaoController < ApplicationController

  layout false

  def instituicao
  	@filtroInst = []
    if session[:filtro_instituicao]
      @filtroInst = session[:filtro_instituicao].split(/,/)
    end
  	@organizations = Organization.only(:organization)
    respond_to do |format|
      	format.html
      	format.json { render json: @organizations.where(organization: /#{Regexp.escape(params[:q])}/i ) }
    end
  end

  def filtroInstituicao
    session[:filtro_instituicao] = params[:instituicoes]
    respond_to do |format|
      format.html {
        redirect_to "/instituicao", status: :moved_permanently
      }
    end
  end

end
