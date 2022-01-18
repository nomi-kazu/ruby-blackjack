class Dealer
  def initialize
    @dealer_hands = []
  end

  def dealer_first_draw(deck)
    2.times do
      deck.create
      card = deck.draw
      @dealer_hands << card
    end

    puts <<~TEXT
    ====ディーラーの手札====
    1枚目：#{@dealer_hands.first.info}
    2枚目：伏せられている
    ========================
    TEXT
  end

  def cal_score_dealer
    dealer_score = 0
    @dealer_hands.each do |hand|
      dealer_score += hand.score
    end
    return dealer_score # 合計スコアを返す
  end

  def draw(deck)
    deck.create
    card = deck.draw
    @dealer_hands << card
  end

  #手札表示
  def show_hand
    puts ""
    puts "====ディーラーの手札===="
    @dealer_hands.each.with_index(1) do |dealer_hand, i|
        puts "#{i}枚目 : #{dealer_hand.info}"
    end 
    puts "ディーラーの合計点数は#{cal_score_dealer}です"
    puts "========================"
    puts ""
  end
end