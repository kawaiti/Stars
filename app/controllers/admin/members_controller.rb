#= メンバーを管理するコントローラ
#
#Author:: かわはら
#Copyright:: Copyright 2009 newness
class Admin::MembersController < ApplicationController

  layout "admin/admin_template"

  #== メンバーの一覧を表示 
  #
  #==== 引数 
  #* 無し
  #
  #==== 戻り値
  #* @members : Memberモデルインスタンスの配列
  def index
    @members = Member.find(:all)
  end

  #== メンバーの新規作成
  # 
  #==== 引数
  #* 無し
  #==== 戻り値 
  #* @member : Memberモデルインスタンス
  def new
    @member = Member.new
  end

  #== メンバーの新規登録
  # 
  #==== 引数
  #* params[:member] => Memberモデルの属性情報
  # 
  #==== 戻り値
  #* @member : Memberモデルインスタンス
  def create
    @member = Member.new
    role = Role.find(params[:member][:role_id])

    @member.attributes = params[:member]
    @member.own_stars = role.default_stars || 0
    @member.received_stars = 0

    unless @member.save
      message = "データの保存に失敗しました。"
      model_errors(:errors => @member.errors, :message => message)
      redirect_to :action => :new
    end
  end

  #== メンバーの編集
  # 
  #==== 引数
  #* params[:id] => 編集対象のMemberモデルのID
  # 
  #==== 戻り値
  #* @member : Memberモデルインスタンス
  def edit
    @member = Member.find(params[:id])
  end

  #== メンバーの更新
  # 
  #==== 引数
  #* params[:id] => 編集対象のMemberモデルのID
  #* params[:member] => Memberモデルの属性情報
  #
  # 
  #==== 戻り値
  #* @member : Memberモデルインスタンス
  def update
    @member = Member.find(params[:id])
    @member.attributes = params[:member]
    unless @member.save
      message = "データの更新に失敗しました。"
      model_errors(:errors => @member.errors, :message => message)
      redirect_to :action => :edit
    end
  end

  #== メンバーの削除
  # 
  #==== 引数
  #* params[:id] => 削除対象のMemberモデルのID
  # 
  #==== 戻り値
  #* @member : Memberモデルインスタンス
  def delete
    @member = Member.find(params[:id])
    unless @member.destroy
      message = "データの削除に失敗しました。"
      model_errors(:errors => @member.errors, :message => message)
      redirect_to :action => :edit
    end
  end

end
