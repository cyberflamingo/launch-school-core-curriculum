def block_word?(word)
  spelling_blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                     ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                     ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

  characters = word.upcase.chars
  result = characters.map do |character|
    spelling_blocks.map.with_index do |block, index|
      if block.any?(character)
        spelling_blocks.delete_at(index)

        character
      end
    end
  end

  result.flatten.compact == characters
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
