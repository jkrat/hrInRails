class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|

      t.string :name, null: false, default: ''
      t.string :slug, null: false, unique: true

      t.boolean :is_active,               null: false, default: false

      t.timestamps
      t.index [:created_at]
    end

    change_table :users do |t|
      t.references :organization, foreign_key: true
    end

    change_table :employees do |t|
      t.references :organization, foreign_key: true
    end
  end
end
