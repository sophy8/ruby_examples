class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string:idea_id
      t.string:author
      t.string:body

      t.timestamps
    end
  end
end
