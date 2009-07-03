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

    big_star = options[:big_star].nil? ? true : options[:big_star]

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
  
  #== サプライズ（ひょこっ）を表示するヘルパーメソッド
  #
  #==== 引数
  #* :target => "ファイル名" : サプライズ画像（デフォルト値 : star3.gif）
  #* :delay => integer : サプライズが表示されるまでの時間（デフォルト値 : 10秒）
  #* :snap => flote : サプライズ画像が表示されている時間（デフォルト値 : 1.1秒）
  #* :rate => integer : フィーバー機能発動レート（デフォルト値：20）
  #
  #==== 戻り値
  #* javascriptなど
  #
  def hyoko_suprise(options = {})
    target = options[:target] || "star3.gif"
    delay = options[:delay] || 10
    snap = options[:snap] || 1.1
    rate = options[:rate] || 20
    rate = 1 if rate < 1

    if (rand * rate).to_i % rate == 0
      result = "<div id='hyoko' style='position:fixed; display:none; z-index:100; top:0px; left:0px'>" + image_tag(target) + "</div>"
      result << "<script> function hyoko_suprise(){"
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
      result = "<script> function hyoko_suprise() {return true;} </script>"
    end
    return result
  end

  #== サプライズ（ざわ）を表示するヘルパーメソッド
  #
  # サプライズで画像を表示するヘルパーメソッドです。
  # 画面全体に画像がフェイドインしてフェイドアウトします。
  # 画像を2個指定すると、指定した確率で画像をミックスして表示されます。
  #
  #=== 引数
  #* :target => "ファイル名" : サプライズ画像（デフォルト値 : なし）
  #* :target1 => "ファイル名" : サプライズ画像１（デフォルト値 : zawa1.gif）
  #* :target2 => "ファイル名" : サプライズ画像２（デフォルト値 : zawa2.gif）
  #* :delay => flote : サプライズを表示するまでの時間（デフォルト値 : 10秒）
  #* :show_time => flote : サプライズを表示している時間（デフォルト値 : 2.0秒）
  #* :rate => integer : サプライズが起こる確率（デフォルト値 : 20）
  #* :zawa_rate => integer : 画像１がでる確率（デフォルト値 : 5）
  #* :x_count => integer : x方向に画像を表示する回数（デフォルト値 : 20）
  #* :y_count => integer : y方向に画像を表示する回数（デフォルト値 : 30）
  #
  #=== 戻り値
  #* javascriptなど
  #
  def zawa_suprise(options = {})
    target1 = options[:target1] || options[:target] || "zawa1.gif"
    target2 = options[:target2] || options[:target] || "zawa2.gif"
    delay = options[:delay] || 10
    show_time = options[:show_time] || 2.0
    rate = options[:rate] || 20
    zawa_rate = options[:zawa_rate] || 5
    x_count = options[:x_count] || 20
    y_count = options[:y_count] || 30
    
    if (rand * rate).to_i % rate == 0 
      result = "<script> function zawa_suprise(){"
      result << render(:update) do |page|
                  page.delay(delay) do
                    page.visual_effect(:appear, "zawa_suprise")
                    page.delay(show_time) do
                      page.visual_effect(:fade, "zawa_suprise")
                    end
                  end
                end
      result << "} </script>"
      result << "<div id='zawa_suprise' style='position:fixed; display:none; z-index:100; left:0px; top:0px;'>"
      y_count.times do |y|
        result << "<nobr>"
        x_count.times do |x|
          if (rand * zawa_rate).to_i % zawa_rate == 0
            result << image_tag(target1)
          else
            result << image_tag(target2)
          end
        end
        result << "</nobr><br>"
      end
      result << "</div>"
    else
      result = "<script> function zawa_suprise() {return true;} </script>"
    end
    return result
  end

end
