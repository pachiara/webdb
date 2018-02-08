class SearchController < ApplicationController
  def index
    @title = t('actions.search') + " " + t('activerecord.models.instances')
    if params[:manage].nil? then
      params[:manage] = "off"
    end
    if !session[:search_manage].nil? then
      params[:manage] = session[:search_manage]
    end

    # paginazione
    # default 10 righe per pagina
    if params[:per_page].nil? || params[:per_page].to_s.strip.length == 0
      params[:per_page] = 5
    end
    # ricerca
    @servers = Server.page(params[:page]).per(params[:per_page])

    session[:search_manage] = params[:manage]

  end
end
