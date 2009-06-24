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
  has_many :sent,
           :class_name => "Star",
           :foreign_key => :sender_id
  has_many :received,
           :class_name => "Star",
           :foreign_key => :recerver_id

  #== スターを送る
  #
  #==== 引数
  #* :receiver => integer : スター受取メンバーのID
  #* :activity => integer : スターを付ける活動のID
  #
  #==== 戻り値
  #* true : スター付け成功
  #* false : スター付け失敗
  #
  def send_star(options = {})
    attributes[:receiver_id] = options[:receiver]
    attributes[:activity_id] = options[:activity]
    parameter = { :id => attributes[:activity_id] }

    # 活動が受取メンバーの活動かどうか確認
    activity = Activity.find(:first, :conditions => parameter)

    # 活動が無かったらスター付け失敗
    return false if activity.blank?

    # 活動が受取メンバーの活動では無かったらスター付け失敗
    return false if activity.member_id != attributes[:receiver_id]

    # 残りのスターが無い場合はスター付け失敗
    return false if self.remaining_stars <= 0

    self.build_sent(attributes)
    self.remaining_stars -= 1
    self.save
  end
end
