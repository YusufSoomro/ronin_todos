class AddTaskListAndTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.string :name

      t.timestamps
    end

    create_table :tasks do |t|
      t.string :name
      t.boolean :is_done, default: false
      t.integer :task_list_id

      t.timestamps
    end
  end
end
