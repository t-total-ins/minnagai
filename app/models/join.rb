# == Schema Information
#
# Table name: joins
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  project_id       :integer
#  number_of_orders :integer          not null
#  purpose          :text(10)
#  join_maker       :text(100)
#  join_product     :text(100)
#  join_attract     :text(1000)
#  join_option      :text(1000)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deleted_at       :datetime
#

class Join < ApplicationRecord
  belongs_to :account
  belongs_to :project

  validates :number_of_orders, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 999 }
  validates :purpose, length: { maximum: 10 }
  validates :join_maker, length: { maximum: 100 }
  validates :join_product, length: { maximum: 100 }
  validates :join_attract, length: { maximum: 1000 }
  validates :join_option, length: { maximum: 1000 }
end
