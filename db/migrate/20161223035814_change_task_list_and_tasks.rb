class ChangeTaskListAndTasks < ActiveRecord::Migration[5.0]
  def up
    create_table :subtasks do |t|
      t.string :description, null: false
      t.boolean :is_done, default: false, null: false
      t.integer :task_id, null: false

      t.timestamps
    end

    rename_column :task_lists, :name, :description
    change_column_null :task_lists, :description, false

    add_column :task_lists, :file_path, :string, null: false
    add_column :task_lists, :times_displayed, :integer, default: 0, null: false

    rename_column :tasks, :name, :description
    change_column_null :tasks, :description, false
    change_column_null :tasks, :task_list_id, false
  end

  def down
    drop_table :subtasks

    rename_column :task_lists, :description, :name
    change_column_null :task_lists, :name, true

    remove_column :task_lists, :file_path
    remove_column :task_lists, :times_displayed

    rename_column :tasks, :description, :name
    change_column_null :tasks, :name, true
    change_column_null :tasks, :task_list_id, true
  end
end
