# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  content     :string
#  content_no  :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class Code < ApplicationRecord
end
