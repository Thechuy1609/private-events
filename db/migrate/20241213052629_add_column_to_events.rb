class AddColumnToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :date_time, :date
  end
end
