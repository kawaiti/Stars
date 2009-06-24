#= スターを管理するコントローラ
#
#Author:: かわはら
#Copyright:: Copyright 2009 newness
class Admin::StarsController < ApplicationController

  layout "admin/admin_template"

  #== スターの一覧表示 
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* @stars : Starモデルインスタンスの配列
  #
  def index
    @stars = Star.find(:all)
  end

  #== スターの新規作成
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* @star : Starモデルインスタンス
  #
  def new
    @star = Star.new
  end

  #== スターの新規登録
  #
  #==== 引数
  #* params[:star] => Starモデルの属性情報
  #
  #==== 戻り値
  #* @star : Starモデルインスタンス
  #
  def create
    @star = Star.new
    @star.attributes = params[:star]
    unless @star.save
      message = "データの保存に失敗しました。"
      model_errors(:errors => @star.errors, :message => message)
    end
  end

  #== スターの編集
  #   
  #==== 引数
  #* params[:id] => 編集対象のStarモデルのID 
  #  
  #==== 戻り値
  #* @star : Starモデルインスタンス 
  #
  def edit
    @star = Star.find(params[:id])
  end

  #== スターの更新
  #   
  #==== 引数
  #* params[:id] => 更新対象のStarモデルのID
  #* params[:star] => Starモデルの属性情報
  #
  #==== 戻り値
  #* @star : Starモデルインスタンス
  # 
  def update
    @star = Star.find(params[:id])
    @star.attributes = params[:star]
    unless @star.save
      message = "データの更新に失敗しました。"
      model_errors(:errors => @star.errors, :message => message)
    end
  end

  #== スターの削除
  #   
  #==== 引数
  #* params[:id] => 削除対象のStarモデルのID
  #
  #==== 戻り値
  #* @star : Starモデルインスタンス
  # 
  def delete
    @star = Star.find(params[:id])
    unless @star.destroy
      message = "データの削除に失敗しました。"
      model_errors(:errors => @star.errors, :message => message)
    end
  end

end
