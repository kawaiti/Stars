# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #== 星を表示するヘルパーメソッド 
  #
  #==== 引数
  #* :number => integer : 星の数（デフォルト値：1）
  #* :weight => intefer : 大きい星の重み（デフォルト値：10）
  #* :big_star => true | false : 大きい星を使う（デフォルト値：true）
  #
  #==== 戻り値
  #* image_tag
  #
  def show_stars(options = {})
    result = "" 
    number = options[:number] || 1
    weight = options[:weight] || 10
    big_star = options[:big_star]
    big_star = true if big_star.nil?

    star1 = "star1.gif"
    star2 = "star2.gif"
    star2 = "star3.gif" if (rand * 100).to_i % 100 == 1 

    if big_star
      result = image_tag(star1, :size => "30x30", :mouseover => star2) * (number / weight)
      result << image_tag(star1, :size => "20x20", :mouseover => star2) * (number % weight)
    else
      result = image_tag(star1, :size => "20x20", :mouseover => star2) * number
    end
    return result
  end
end
