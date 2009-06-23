#= 活動を管理するコントローラ
#
#Author:: かわはら
#Copyright:: Copyright 2009 newness
class Admin::ActivitiesController < ApplicationController

  layout "admin/admin_template"

  #== 活動の一覧を表示
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* @activities : Activityモデルインスタンスの配列
  #
  def index
    @activities = Activity.find(:all)
  end

  #== 活動の新規作成
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* @activity : Activityモデルインスタンス
  #
  def new
    @activity = Activity.new
  end

  #== 活動の新規登録
  #
  #==== 引数
  #* params[:activity] => Activityモデルの属性情報
  #
  #==== 戻り値
  #* @activity : Activityモデルインスタンス
  #
  def create
    @activity = Activity.new
    @activity.attributes = params[:activity]
    unless @activity.save
      message = "データの作成に失敗しました。"
      model_errors(:errors => @activity.errors, :message => message)
    end
  end

  #== 活動の編集
  #
  #==== 引数
  #* params[:id] => 編集対象のActivityモデルのID
  #
  #==== 戻り値
  #* @activity : Activityモデルインスタンス
  #
  def edit
    @activity = Activity.find(params[:id])
  end

  #== 活動の更新
  #
  #==== 引数
  #* params[:id] => 編集対象のActivityモデルのID
  #* params[:activity] => Activityモデルの属性情報
  #
  #==== 戻り値
  #* @activity : Activityモデルインスタンス
  # 
  def update
    @activity = Activity.find(params[:id])
    @activity.attributes = params[:activity]
    unless @activity.save
      message = "データの更新に失敗しました。"
      model_errors(:errors => @activity.errors, :message => message)
    end
  end

  #== 活動の削除
  #
  #==== 引数
  #* params[:id] => 編集対象のActivityモデルのID
  #
  #==== 戻り値
  #* @activity : Activityモデルインスタンス
  # 
  def delete
    @activity = Activity.find(params[:id])
    unless @activity.destroy
      message = "データの削除に失敗しました。"
      model_errors(:errors => @activity.errors, :message => message)
    end
  end

end
