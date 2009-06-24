# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #== 星を表示するヘルパーメソッド 
  #
  #==== 引数
  #* :number => integer : 星の数（デフォルト値：1）
  #* :weight => integer : 大きい星の重み（デフォルト値：10）
  #* :rate => integer : フィーバー機能発動レート（デフォルト値：100）
  #* :big_star => true | false : 大きい星を使う（デフォルト値：true）
  #
  #==== 戻り値
  #* image_tag
  #
  def show_stars(options = {})
    result = "" 
    number = options[:number] || 1
    weight = options[:weight] || 10
    rate = options[:rate] || 100
    rate = 1 if rate < 1
    big_star = options[:big_star]
    big_star = true if big_star.nil?

    star1 = "star1.gif"
    star2 = "star2.gif"

    # フィーバー機能
    star2 = "star3.gif" if (rand * rate).to_i % rate == 0 

    if big_star
      result = image_tag(star1, :size => "30x30", :mouseover => star2) * (number / weight)
      result << image_tag(star1, :size => "20x20", :mouseover => star2) * (number % weight)
    else
      result = image_tag(star1, :size => "20x20", :mouseover => star2) * number
    end
    return result
  end
  
  #== サプライズを表示するヘルパーメソッド
  #
  #==== 引数
  #* :target => "ファイル名" : サプライズ画像（デフォルト値：star3.gif）
  #* :delay => integer : サプライズが表示されるまでの時間（デフォルト値：10）
  #* :snap => flote : サプライズ画像が表示されている時間（デフォルト値：1.1）
  #* :rate => integer : フィーバー機能発動レート（デフォルト値：20）
  #
  #==== 戻り値
  #* javascriptなど
  #
  def show_suprise(options = {})
    target = options[:target] || "star3.gif"
    delay = options[:delay] || 10
    snap = options[:snap] || 1.1
    rate = options[:rate] || 20
    rate = 1 if rate < 1

    if (rand * rate).to_i % rate == 0
      result = "<div id='hyoko' style='display:none'>" + image_tag(target) + "</div>"
      result << "<script> function suprise(){"
      result << render(:update) do |page|
                  page.delay(delay) do
                    page.visual_effect(:slide_down, "hyoko")
                    page.delay(snap) do
                      page.visual_effect(:slide_up, "hyoko")
                    end
                  end
                end
      result << "} </script>"
    else
      result = "<script> function suprise() {return true;} </script>"
    end
    return result
  end

end
