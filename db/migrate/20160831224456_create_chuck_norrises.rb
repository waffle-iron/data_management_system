class CreateChuckNorrises < ActiveRecord::Migration[5.0]
  def change
    create_table :chuck_norrises do |t|
      t.text :fact
      t.integer :knockouts

      t.timestamps
    end
  end
end
