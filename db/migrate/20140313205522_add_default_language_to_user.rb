class AddDefaultLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_language_code, :string
  end
end
