class InstancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instance, only: [:show, :edit, :update, :destroy, :check]

  # GET servers/1/instances
  # GET servers/1/instances.json
  def index
    @user = User.new
    @title = t('actions.listing') + " " + t('activerecord.models.instances')
    @edit   = helpers.set_edit(current_user)
    @manage = helpers.set_manage(current_user)
    # legge server
    @server = Server.find(params[:server_id])
    @commands = Command.all

    # paginazione
    # default 10 righe per pagina
    if params[:per_page].nil? || params[:per_page].to_s.strip.length == 0
      params[:per_page] = 5
    end
    # ricerca
    @instances = @server.instances.page(params[:page]).per(params[:per_page])

  end

  # GET servers/1/instances/1
  # GET servers/1/instances/1.json
  def show
  end

  # GET servers/1/instances/new
  def new
    @title = t('actions.new') + " " + t('activerecord.models.instance')
    @server = Server.find(params[:server_id])
    @instance = Instance.new
    @url = server_instances_path
  end

  # GET servers/1/instances/1/edit
  def edit
    @title = t('actions.edit') + " " + t('activerecord.models.instance')
    @server = Server.find(params[:server_id])
    @url = server_instance_path
  end

  # POST servers/1/instances
  # POST servers/1/instances.json
  def create
    @title = t('actions.new') + " " + t('activerecord.models.instance')
    @instance = Instance.new(instance_params)
    @server = Server.find(params[:server_id])
    @instance.server_id = params[:server_id]
    @url = server_instances_path

    respond_to do |format|
      if @instance.save
        format.html { redirect_to server_instances_path, notice: t('activerecord.models.instance') + " " + t('notice.create') }
        format.json { render :index, status: :created, location: @instance }
      else
        format.html { render :new }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT servers/1/instances/1
  # PATCH/PUT servers/1/instances/1.json
  def update
    @title = t('actions.edit') + " " + t('activerecord.models.instance')
    @url = server_instance_path
    @server = Server.find(params[:server_id])

    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to server_instances_path, notice: t('activerecord.models.instance') + " " + t('notice.update') }
        format.json { render :index, status: :ok, location: @instance }
      else
        format.html { render :edit }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server/1/istances/destroy
  # DELETE /server/1/istances/destroy.json
  def destroy
    @server = Server.find(params[:server_id])
    @server.instances.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to server_instances_path, notice: t('activerecord.models.instance') + " " + t('notice.delete') }
      format.json { head :no_content }
    end
  end

  # GET servers/1/instances/1/check/1
  # GET servers/1/instances/1/check/1.json
  def check
    @command = Command.find(params[:command_id])
    @result = %x[#{@command.exec} -lart]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.require(:instance).permit(:server_id, :name, :port, :service_id, :note, :check, :command_id)
    end
end
