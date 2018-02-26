# == Schema Information
#
# Table name: notices
#
#  id         :integer          not null, primary key
#  title      :text(100)        not null
#  content    :text(1000)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  to_project :integer
#  to_user    :integer
#

class Notice < ApplicationRecord
  validates :title, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true
  #validates :notice_to, length: { maximum: 100 }
  validates :to_project, length: { maximum: 8 }
  validates :to_user, length: { maximum: 8 }
end
