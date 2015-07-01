class ChangeCommentsColumn < ActiveRecord::Migration
  def change
    remove_column :comments, :job_id
    change_table :comments do |t|
      t.belongs_to :job, index: true
    end
  end
end
