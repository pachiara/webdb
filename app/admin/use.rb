ActiveAdmin.register Use do
#show do
#    h3 t('actions.show') + " " + t('activerecord.models.use')
#    attributes_table do
#      row :code
#      row :description
#    end
#    active_admin_comments
#end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :code, :description
end
