require 'pry'

class BeerSong
  def self.verse(num)
    case num
    when 0
      sing_last
    when 1
      sing_penultimate
    else
      sing(num)
    end
  end

  def self.verses(*nums)
    (nums.last..nums.first).to_a.reverse.map do |num|
      verse(num)
    end.join("\n")
  end

  def self.sing_last
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.sing_penultimate
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.sing(num)
    bottle = (num - 1) == 1 ? 'bottle' : 'bottles'

    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} #{bottle} of beer on " \
      "the wall.\n"
  end

  def self.lyrics
    verses(99, 0)
  end
end
