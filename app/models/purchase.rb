# == Schema Information
#
# Table name: purchases
#
#  id               :integer          not null, primary key
#  project_id       :integer
#  account_id       :integer
#  number_of_orders :integer
#  total_amount     :integer
#  due_date         :datetime
#  payment_flg      :boolean
#  delivery_flg     :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deleted_at       :datetime
#

class Purchase < ApplicationRecord
  belongs_to :project
  belongs_to :account
end
