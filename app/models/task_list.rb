# == Schema Information
#
# Table name: task_lists
#
#  id              :integer          not null, primary key
#  description     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  file_path       :string           not null
#  times_displayed :integer          default("0"), not null
#

class TaskList < ApplicationRecord
  validates :description, :file_path, :times_displayed, presence: true
  validates :times_displayed, numericality: { only_integer: true }

  has_many :tasks, dependent: :destroy
end
