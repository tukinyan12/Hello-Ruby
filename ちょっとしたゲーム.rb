require 'gosu'

class RPG◆ < Gosu::Window
  def initialize
    super(1024, 820) # ウィンドウのサイズ
    @x_player = 10 # プレイヤーの設定
    @y_player = 10
    @player_HP = 20
    @Mob_x = 90 # MOBの設定
    @Mob_y = 90
    @Mob_HP = 90
    @background_color = Gosu::Color:: WHITE # 背景
    self.caption = "===◆試作品◆===" # ウィンドウのタイトル
  end

  def update
    # ゲームロジック（毎フレームの処理）
    @x_player += 5 if Gosu.button_down?(Gosu::KB_RIGHT)
    @x_player -= 5 if Gosu.button_down?(Gosu::KB_LEFT)
    @y_player += 5 if Gosu.button_down?(Gosu::KB_DOWN)
    @y_player -= 5 if Gosu.button_down?(Gosu::KB_UP)
    update_mob
    update_HP
  end
  
  def update_mob
    @mob_direction ||= :right
    case @mob_direction
    when :right
      @Mob_x += 2
      @mob_direction = :left if @Mob_x >= 500
    when :left
      @Mob_x -= 2
      @mob_direction = :up if @Mob_x <= 20
    when :up
      @Mob_y -= 2
      @mob_direction = :down if @Mob_y <= 20
    when :down
      @Mob_y += 2
      @mob_direction = :right if @Mob_y >= 500
    end
  end
  



  def update_HP
    if (@x_player - @Mob_x).abs < 30 && (@y_player - @Mob_y).abs < 30;
      if @player_HP < 0
        close
      else
        @player_HP -= 0.1
      end
    end
  end
 
 
  def draw
    Gosu.draw_rect(0, 0, 12000, 12000, @background_color)
    Gosu.draw_rect(@x_player, @y_player, 30, 30, Gosu::Color::RED)
    Gosu.draw_rect(@Mob_x, @Mob_y, 30, 30, Gosu::Color::BLUE)
    Gosu::Font.new(20).draw_text("Player HP: #{@player_HP}", 90, 5, 2, 2, 2, Gosu::Color::BLACK)
  end
end


RPG◆.new.show
