ActiveAdmin.register AdminUser do

  permit_params :email, :password, :password_confirmation, :username

  # actions :all, :except => [:destroy]
  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def destroy
      if AdminUser.count == 1
        flash[:alert] = "There's only 1 admin user. You cannot delete it."
        redirect_to :action => :index
      else

        super
      end
    end
  end
end
