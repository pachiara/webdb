class ServersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
    @user = User.new
    @title = t('actions.listing') + " " + t('activerecord.models.server')
    @edit   = helpers.set_edit(current_user)
    @manage = helpers.set_manage(current_user)

    # paginazione
    # default 10 righe per pagina
    if params[:per_page].nil? || params[:per_page].to_s.strip.length == 0
      params[:per_page] = 15
    end
    # ricerca
    @servers = Server.order("ip").page(params[:page]).per(params[:per_page])

  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @title = t('actions.new') + " " + t('activerecord.models.server')
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
    @title = t('actions.edit') + " " + t('activerecord.models.server')
  end

  # POST /servers
  # POST /servers.json
  def create
    @title = t('actions.new') + " " + t('activerecord.models.server')
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to servers_url, notice: t('notice.create') }
        format.json { render :index, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    @title = t('actions.edit') + " " + t('activerecord.models.server')
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to servers_url, notice: t('notice.update') }
        format.json { render :index, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: t('notice.delete') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:ip, :name, :use_id, :description, :note, :domain_id, :type_id, :manage)
    end
end
