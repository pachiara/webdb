ActiveAdmin.register User do

  index do
    column :email
    column :created_at
    column :updated_at
    actions
  end

#  show do
#    h3 user.email
#      div do
#        h4 user.created_at
#        h4 user.updated_at
#      end
#  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

#  form do |f|
#      tabs do
#        tab 'Basic' do
#          f.inputs 'Basic Details' do
#            f.input :email
#            f.input :password
#            f.input :password_confirmation
#          end
#        end

#        tab 'Advanced' do
#          f.inputs 'Advanced Details' do
#            f.input :role
#          end
#        end
#      end
#      f.actions
#    end



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
  permit_params :email, :encrypted_password, :password, :password_confirmation

end
