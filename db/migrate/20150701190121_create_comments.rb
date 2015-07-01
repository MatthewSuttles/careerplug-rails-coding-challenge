class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.sting :desciption
      t.belongs_to :job
      t.timestamps null: false
    end
  end
end
