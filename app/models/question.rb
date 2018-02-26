# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  project_id :integer
#  account_id :integer
#  q_and_a    :text(1)          not null
#  title      :text(100)        not null
#  content    :text(1000)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class Question < ApplicationRecord
  belongs_to :project
  belongs_to :account
  validates :q_and_a, length: { maximum: 1 }, presence: true
  validates :title, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true
end
