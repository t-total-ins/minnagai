# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#  admin_flg              :boolean
#

class Account < ApplicationRecord
  has_one :user, :dependent => :destroy
  has_many :projects, :dependent => :nullify
  has_many :joins, :dependent => :destroy
  has_many :questions, :dependent => :nullify
  has_many :purchases, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  validates :email, :uniqueness_without_deleted => true

    def self.included(base)
      base.extend ClassMethods
      assert_validations_api!(base)

      base.class_eval do
        validates_presence_of   :email, if: :email_required?
        # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
        validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

        validates_presence_of     :password, if: :password_required?
        validates_confirmation_of :password, if: :password_required?
        validates_length_of       :password, within: password_length, allow_blank: true
      end
    end
end
