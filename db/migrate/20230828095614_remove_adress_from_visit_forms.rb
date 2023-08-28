class RemoveAdressFromVisitForms < ActiveRecord::Migration[7.0]
  def change
    rename_column :visit_forms, :adress, :address
  end
end
