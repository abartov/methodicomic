class CreateUserIssues < ActiveRecord::Migration
  def change
    create_table :user_issues do |t|
      t.boolean :acquired
      t.boolean :finished
      t.date :started_on
      t.date :finished_on
      t.string :comment
      t.references :user, index: true
      t.references :issue, index: true

      t.timestamps
    end
  end
end
