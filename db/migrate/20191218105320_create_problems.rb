class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :inputs
      t.text :outputs
      t.string :solution_function

      t.timestamps
    end
  end
end
