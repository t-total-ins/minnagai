# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  account_id   :integer
#  first_name   :string(15)       not null
#  name         :string(15)       not null
#  first_name_k :string(15)       not null
#  name_k       :string(15)       not null
#  pref         :string(10)       not null
#  city         :string(10)       not null
#  address      :string(50)       not null
#  post_number  :string(7)        not null
#  tel          :string(13)       not null
#  birth        :date             not null
#  sex          :integer          not null
#  mail         :string(100)      not null
#  delete_flg   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#

class User < ApplicationRecord

      # 全角カタカナ
      VALID_KANA_REGEX = /\A[ァ-ンー－]+\z/
      #: 郵便番号（ハイフンなし7桁）
      VALID_POST_REGEX = /\A\d{7}\z/
      #: 固定電話と携帯番号(ハイフンなし10桁or11桁)
      VALID_PHONE_REGEX = /\A\d{10}\z|\A\d{11}\z/
      #mailチェック
      #VALID_EMAIL_REGEX = /A([^@s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})Z/i
      VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
      # 誕生日　日付チェック　日付フィールドから入力だから不要
      #VALID_BIRTH_REGEX = /\A\d{8}\z/

      belongs_to :account

      #validates :account_id, uniqueness: true, presence: true
      validates :first_name, length: { maximum: 15 }, presence: true
      validates :name, length: { maximum: 15 }, presence: true
      validates :first_name_k, length: { maximum: 15 }, presence: true, format: {with: VALID_KANA_REGEX }
      validates :name_k, length: { maximum: 15 }, presence: true, format: {with: VALID_KANA_REGEX }
      validates :pref, length: { maximum: 10 }, presence: true
      validates :city, length: { maximum: 10 }, presence: true
      validates :address, length: { maximum: 50 }, presence: true
      validates :post_number, length: { maximum: 7 }, presence: true, format: {with: VALID_POST_REGEX }
      #validates :pref_k, length: { maximum: 20 }, presence: true, format: {with: VALID_KANA_REGEX }
      #validates :city_k, length: { maximum: 30 }, presence: true, format: {with: VALID_KANA_REGEX }
      #validates :address_k, length: { maximum: 100 }, presence: true, format: {with: VALID_KANA_REGEX }
      validates :tel, length: { maximum: 11 }, presence: true, format: {with: VALID_PHONE_REGEX }
      validates :birth, presence: true #, format: {with: VALID_BIRTH_REGEX }
      validates :sex, length: { maximum: 1 }, presence: true
      #account でunique制約済み
      validates :mail, length: { maximum: 100 }, presence: true, format: { with: VALID_EMAIL_REGEX }
end
