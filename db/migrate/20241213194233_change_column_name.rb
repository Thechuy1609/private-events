class ChangeColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :events, :date, :description
  end
end
