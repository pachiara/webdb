class ServiceTypesController < InheritedResources::Base

  private

    def service_type_params
      params.require(:service_type).permit(:code, :description)
    end
end

