ActiveAdmin.register User do
  index do
    column :email
    column :name
    column :avatar
    actions
  end

  filter :email
  filter :name
  filter :country

  form title: 'User Edit' do |f|
    inputs 'Profile' do
      input :email
      input :name
      input :bio
    end
    inputs 'Address' do
      input :city
      input :province
      input :country
    end
    panel 'Update Password' do
      "Enter the password twice below to update the user's password."
    end
    inputs 'Password Reset' do
      input :password
      input :password_confirmation
    end
    inputs "User Avatar" do
      input :avatar, as: :file
    end
    para "Press cancel to return to the user list without saving."
    actions
  end

    show do
    attributes_table do
      row :name
      row :email
      row :bio
      row :city
      row :province
      row :country
      row :avatar do |user|
        if user.avatar.attached?
          image_tag user.avatar, :style => "width: 20%;"
        else
          "No Photo"
        end
      end
    end
    active_admin_comments
  end

  controller do
    def update_resource object, attributes
      attributes.each do |attr|
        if attr[:password].blank? and attr[:password_confirmation].blank?
          attr.delete :password
          attr.delete :password_confirmation
        end
      end

      object.send :update_attributes, *attributes
    end
  end

  permit_params do
    permitted = [:email, :name, :bio, :city, :province, :postal_code, :country, :password, :password_confirmation, :avatar]
  end
end
