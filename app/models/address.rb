class Address < ApplicationRecord
  belongs_to :customer
  
  def full_name
    self.post_address + self.street_address + self.address
  end
  # full_nameはカラム連結させて表示させている。
end
