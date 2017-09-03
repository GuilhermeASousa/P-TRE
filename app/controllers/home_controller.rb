class HomeController < ApplicationController

  autocomplete :userInfo, :handle
  require 'json'

  def index
    @here = 1
    if session[:handle1]
      session[:handle1].clear
    end
    if session[:handle2]
      session[:handle2].clear
    end
    if session[:handle3]
      session[:handle3].clear
    end
    @handle = session[:handle]
    if session[:filtro_candidato] and session[:filtro_candidato] != ""
      @filtroCand = session[:filtro_candidato].split(/,/)
    end
    respond_to do |format| 
      format.html
    end
  end

  def create
    if session[:handle]
      session[:filtro_instituicao].clear
      session[:filtro_candidato].clear
    end
    session[:handle] = params[:search]
    respond_to do |format|
      format.html {
        redirect_to "/", status: :moved_permanently
    }
    end
  end

end
