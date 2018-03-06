class OperatingSystemsController < InheritedResources::Base

  private

    def operating_system_params
      params.require(:operating_system).permit(:code, :description, :unix, :win)
    end
end
