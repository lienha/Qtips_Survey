class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :answer
      t.belongs_to :sample
      t.timestamps
    end
  end
end
