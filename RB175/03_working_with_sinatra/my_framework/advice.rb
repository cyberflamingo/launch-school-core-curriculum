class Advice
  def initialize
    @advice_list = [
      "Look deep into nature, and then you will understand everything better.",
      "I have found the paradox, that if you love until it hurts, there can be no more hurt, only more love.",
      "What we think, we become.",
      "Love all, trust a few, do wrong to none.",
      "Oh, my friend, it's not what they take away from you that counts. It's what you do with what you have left.",
      "Lost time is never found again.",
      "Nothing will work unless you do."
    ]
  end

  def generate
    @advice_list.sample
  end
end
