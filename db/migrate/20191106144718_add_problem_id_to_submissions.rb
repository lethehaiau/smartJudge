class AddProblemIdToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :problem_id, :integer
  end
end
