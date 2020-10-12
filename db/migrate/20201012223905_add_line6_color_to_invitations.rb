class AddLine6ColorToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :line6_color, :string
  end
end
