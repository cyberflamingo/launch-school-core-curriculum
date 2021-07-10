class TextAnalyzer
  def process
    File.open('sample_text.txt', 'r') do |text|
      puts yield(text.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| (text.split(/\n\n+/).count).to_s + " paragraphs" }
analyzer.process { |text| (text.split('.').count).to_s + " lines" }
analyzer.process { |text| (text.split(' ').count).to_s + " words" }
