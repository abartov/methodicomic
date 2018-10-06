class CreateUserSeries < ActiveRecord::Migration
  def change
    create_table :user_series do |t|
      t.boolean :finished
      t.boolean :priority
      t.string :comment
      t.references :user, index: true
      t.references :series, index: true

      t.timestamps
    end
  end
end
