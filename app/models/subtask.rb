# == Schema Information
#
# Table name: subtasks
#
#  id          :integer          not null, primary key
#  description :string           not null
#  is_done     :boolean          default("false"), not null
#  task_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subtask < ApplicationRecord
  validates :description, :is_done, :task_id, presence: true
end
