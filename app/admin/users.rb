ActiveAdmin.register User do
  index do
    column :email
    column :name
    column :phone
    column :user_type
    column :avatar
    actions
  end

  filter :email
  filter :name
  filter :country

  form title: 'User Edit' do |f|
    inputs 'Contact Information' do
      input :email
      input :name
      input :phone
      input :whatsapp
    end
    inputs 'Address' do
      input :address
      input :address2
      input :address3
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
    permitted = [:email, :name, :phone, :whatsapp, :address, :address2, :address3, :city, :province, :postal_code, :country, :user_type, :password, :password_confirmation, :avatar]
  end
end
