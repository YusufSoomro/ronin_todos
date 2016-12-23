# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  description  :string           not null
#  is_done      :boolean          default("false")
#  task_list_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Task < ApplicationRecord
  scope :current_tasks, -> { where(is_done: false) }

  validates :description, :task_list_id, presence: true

  belongs_to :task_list
  has_many :subtasks, dependent: :destroy

  CHECK_MARK = "✔"
  BULLET_POINT = "•"

  def is_really_done?
    subtasks.all? { |subtask| subtask.is_done } || is_done
  end
end
