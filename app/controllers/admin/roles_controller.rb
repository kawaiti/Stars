#= 役割を管理するコントローラ
#役割の一覧表示、作成、編集、削除を行います。
#
#Author:: かわはら
#Copyright:: Copyright 2009 newness
class Admin::RolesController < ApplicationController

  layout "admin/admin_template"

  #== 役割の一覧表示
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* @roles : Roleモデルインスタンスの配列
  def index
    @roles = Role.find(:all)
  end

  #== 役割の新規作成
  #
  #==== 引数
  #* 無し
  #
  #==== 戻り値
  #* 無し
  def new
    @role = Role.new
  end

  #== 役割の新規登録
  #
  #==== 引数
  #* params[:role] => Roleモデルの属性情報
  #
  #==== 戻り値
  #* @role : Roleモデルインスタンス
  def create
    @role = Role.new
    @role.attributes = params[:role]
    unless @role.save
      message = "データの作成に失敗しました。"
      model_errors(:errors => @role.errors, :message => message)
    end
  end

  #== 役割の編集
  #
  #==== 引数
  #* params[:id] => 編集対象のRoleモデルのID
  #
  #==== 戻り値
  #* @role : Roleモデルインスタンス
  def edit
    @role = Role.find(params[:id])
  end

  #== 役割の更新
  #
  #==== 引数
  #* params[:id] => 編集対象のRoleモデルのID
  #* params[:role] => Roleモデルの属性情報
  #
  #==== 戻り値
  #* @role : Roleモデルインスタンス
  def update
    @role = Role.find(params[:id])
    @role.attributes = params[:role]
    unless @role.save
      message = "データの更新に失敗しました。"
      model_errors(:errors => @role.errors, :message => message)
    end
  end

  #== 役割の削除
  #
  #==== 引数
  #* params[:id] => 削除対象のRoleモデルのID
  #
  #==== 戻り値
  #* @role : Roleモデルインスタンス
  def delete
    @role = Role.find(params[:id])
    unless @role.destroy
      message = "データの削除に失敗しました。"
      model_errors(:errors => @role.errors, :message => message)
    end
  end

end
