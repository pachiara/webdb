class SearchController < ApplicationController
  def index
    @title = t('actions.search') + " " + t('activerecord.models.instances')

    unless params[:per_page].nil? then params[:manage] = session[:search_manage] end

    # imposta il flag di gestito
    unless params[:manage] == "on" then params[:manage] == "off" end
    if session[:search_manage].nil?
      params[:manage] = "on"
    end

    # paginazione
    # default 10 righe per pagina
    if params[:per_page].nil? || params[:per_page].to_s.strip.length == 0
      params[:per_page] = 8
    end
    if params[:manage] == "on" then manage = '1' else manage = '0' end

    # ricerca
    sel = params[:sel]
    searched = params[:searched]
    if sel.nil? then sel = '1' end
    case sel
      when '1' # descrizione del server
        @instances = Instance.joins(:server).where("servers.manage = ? AND servers.description LIKE ?", manage, "%#{searched}%").order("servers.ip").page(params[:page]).per(params[:per_page])
      when '2' # hostname
        @instances = Instance.joins(:server).where("servers.manage = ? AND servers.name LIKE ?", manage, "%#{searched}%").order("servers.ip").page(params[:page]).per(params[:per_page])
      when '3' # indirizzo IP
        @instances = Instance.joins(:server).where("servers.manage = ? AND servers.ip LIKE ?", manage, "%#{searched}%").order("servers.ip").page(params[:page]).per(params[:per_page])
      when '4' # servizio
        @instances = Instance.joins(:server).where("servers.manage = ?", manage).joins(:service).where("service.description LIKE ?", "%#{searched}%").order("servers.ip").page(params[:page]).per(params[:per_page])
      when '5' # sistema operativo
        @instances = Instance.joins(:server).where("servers.manage = ?", manage).joins(:operating_system).where("operating_system.description LIKE ?", "%#{searched}%").order("servers.ip").page(params[:page]).per(params[:per_page])
    end

#    @servers = Server.page(params[:page]).per(params[:per_page])
#    @servers = Server.where("manage = ?", manage).page(params[:page]).per(params[:per_page])
#      @instances = Instance.joins(:server).where("servers.manage = ?", manage).order("servers.ip").page(params[:page]).per(params[:per_page])
#    @instances = Instance.page(params[:page]).per(params[:per_page])

    session[:search_manage] = params[:manage]

  end
end
