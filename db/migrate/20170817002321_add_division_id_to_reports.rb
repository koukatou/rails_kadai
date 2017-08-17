class AddDivisionIdToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :division_id, :integer
  end
end
