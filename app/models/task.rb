# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  name         :string
#  is_done      :boolean          default("false")
#  task_list_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ApplicationRecord
  scope :current_tasks, -> { where(is_done: false) }
end
