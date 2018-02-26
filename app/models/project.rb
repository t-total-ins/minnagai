# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  account_id       :integer
#  project_category :string(50)       not null
#  project_name     :string(100)      not null
#  maker            :string(50)       not null
#  product          :string(100)      not null
#  option           :text(1000)
#  image1           :binary(5242880)
#  image2           :binary(5242880)
#  image3           :binary(5242880)
#  image4           :binary(5242880)
#  image5           :binary(5242880)
#  attraction       :text(1000)       not null
#  reason           :text(1000)       not null
#  amount_of_money  :integer          default(0), not null
#  project_from     :datetime         not null
#  project_to       :datetime         not null
#  status           :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deleted_at       :datetime
#

class Project < ApplicationRecord
    belongs_to :account
    has_many :joins, :dependent => :destroy
    has_many :questions, :dependent => :destroy
    has_many :purchases, :dependent => :destroy

    mount_uploader :image1, ImagesUploader
    mount_uploader :image2, ImagesUploader
    mount_uploader :image3, ImagesUploader
    mount_uploader :image4, ImagesUploader
    mount_uploader :image5, ImagesUploader	

    validates :account_id, length: { maximum: 9 }
    validates :project_name, length: { maximum: 100 }, presence: true
    validates :project_category,  length: { maximum: 50 }, presence: true
    validates :maker, length: { maximum: 50 }, presence: true
    validates :product, length: { maximum: 100 }, presence: true
    validates :option, length: { maximum: 1000 }
    validates :image1, length: { maximum:  5.megabyte }
    validates :image2, length: { maximum:  5.megabyte }
    validates :image3, length: { maximum:  5.megabyte }
    validates :image4, length: { maximum:  5.megabyte }
    validates :image5, length: { maximum:  5.megabyte }
    validates :attraction, length: { maximum: 1000 }, presence: true
    validates :reason, length: { maximum: 1000 }, presence: true
    validates :amount_of_money, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 99999999 }, presence: true
    #validates :way_of_purchase, length: { maximum: 8 }, presence: true
    #validates :way_of_payment, length: { maximum: 8 }, presence: true
    validates :project_from, presence: true
    validates :project_to, presence: true

    def created_by?(account)
        return false unless account
        account_id == account.id
    end
end
