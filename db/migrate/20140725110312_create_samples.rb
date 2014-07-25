class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.boolean :complete?, default: false
      t.integer :voter_id
      t.integer :survey_id
      t.timestamps
    end
  end
end
