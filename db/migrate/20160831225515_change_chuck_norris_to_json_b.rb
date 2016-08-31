class ChangeChuckNorrisToJsonB < ActiveRecord::Migration[5.0]
  def change
    remove_column :chuck_norrises, :fact, :text
    remove_column :chuck_norrises, :knockouts, :integer
    add_column :chuck_norrises, :kungfu, :jsonb, default: {}
    add_index :chuck_norrises, :kungfu, using: :gin
  end
end
