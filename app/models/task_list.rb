# == Schema Information
#
# Table name: task_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskList < ApplicationRecord
end
