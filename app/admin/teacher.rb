ActiveAdmin.register Teacher do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#

  show do
    attributes_table do
      row('Employee Number'){|t| t.student_number}
      row :username
      row :fullname
      row :created_at
      row :updated_at


    end
    active_admin_comments
  end

  form do |f|
    inputs 'Details' do
      input :student_number, label: "Employee Number"
      input :username
      input :fullname
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    panel 'Markup' do
      "The following can be used in the content below..."
    end

    para "Press cancel to return to the list without saving."
    actions
  end

  permit_params do
    permitted = [:student_number, :fullname, :username, :password, :password_confirmation]
    permitted
  end
end
