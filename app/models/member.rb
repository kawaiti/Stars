#= メンバーを管理するモデル
#
#Author:: かわはら
#Copyright:: Copyright 2009 newness
class Member < ActiveRecord::Base
  #
  # リレーションの設定
  #
  belongs_to :role
  has_many :activities
end
