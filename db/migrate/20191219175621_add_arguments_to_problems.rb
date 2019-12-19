class AddArgumentsToProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :problems, :arguments, :string
  end
end
