# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '541a8cae32ed114bd4818b3d410eb730'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  # モデルのエラーをflash[:errors]にぶち込みます。
  #
  #[引数]
  #* :errors => Model.errorsの戻り値
  #* :message => "エラーメッセージ"
  #
  #[戻り値]
  #* 無し
  #
  #[例]
  # model_errors(:errors => member.errors, :message => "作成できません")
  def model_errors(options = {})
    errors = options[:errors] || nil
    message = options[:message] || "エラー"

    return if errors.nil?

    flash[:errors] = message
    errors.each {|attr, msg| flash[:errors] << attr + " : " + msg}
  end
 
end
