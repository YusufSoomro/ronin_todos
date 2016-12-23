# Generate a timestamp! :) Time.now.strftime("%Y%m%d%H%M%S")

class TaskUpdater
  def self.create_tasks
    last_task_list_file_path = Dir.glob(Rails.root.join("lib", "task_lists", "*")).last
    parsed_yaml = YAML.load(File.read(last_task_list_file_path))

    ActiveRecord::Base.transaction do
      the_new_task_list = TaskList.create!(description: parsed_yaml["the_goal"],
                                           file_path:   last_task_list_file_path)

      parsed_yaml["tasks"].each do |task_attrs|
        task = Task.create!(description: task_attrs["description"], task_list_id: the_new_task_list.id)

        if task_attrs["subtasks"].present?
          task_attrs["subtasks"].each do |subtask_attrs|
            Subtask.create!(description: subtask_attrs["description"], task_id: task.id, is_done: false)
          end
        end
      end
    end
  end
end