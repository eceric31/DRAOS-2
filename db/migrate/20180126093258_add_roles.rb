class AddRoles < ActiveRecord::Migration[5.1]
  def change
    Role.create(id: 1, role: "Admin")
    Role.create(id: 2, role: "Normal User")
  end
end
