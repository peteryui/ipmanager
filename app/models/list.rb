class List < ActiveRecord::Base

  belongs_to :user

  accepts_nested_attributes_for :user

  def set_user_id(method)
    self.update_column(:user_id, method)
  end

  def set_user_ip(method)
    self.update_column(:user_ip, method)
  end

  def clean
    self.update_column(:category, "")
    self.update_column(:user_name, "")
    self.update_column(:phone_number, "")
    self.update_column(:mac_address, "")
    self.update_column(:location, "")
    self.update_column(:description, "")
  end

end
