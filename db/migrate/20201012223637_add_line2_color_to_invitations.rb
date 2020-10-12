class AddLine2ColorToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :line2_color, :string
  end
end
