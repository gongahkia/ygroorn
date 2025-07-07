module Ygroorn
  module Embeddings
    EMBEDDINGS = {}
    def self.load_embeddings(path)
      EMBEDDINGS.clear
      File.foreach(path) do |line|
        tokens = line.strip.split(' ')
        next if tokens.size < 2
        word = tokens.shift
        EMBEDDINGS[word] = tokens.map(&:to_f)
      end
    end
    def self.get_embedding(text, language = nil)
      words = text.downcase.split(/\s+/)
      vectors = words.map { |w| EMBEDDINGS[w] }.compact
      return Array.new(EMBEDDINGS.values.first.size, 0.0) if vectors.empty?
      mean = Array.new(vectors.first.size, 0.0)
      vectors.each do |vec|
        vec.each_with_index { |v, i| mean[i] += v }
      end
      mean.map! { |v| v / vectors.size }
      mean
    end
    def self.cosine_similarity(vec1, vec2)
      dot = vec1.zip(vec2).map { |a, b| a * b }.sum
      norm1 = Math.sqrt(vec1.map { |v| v * v }.sum)
      norm2 = Math.sqrt(vec2.map { |v| v * v }.sum)
      return 0.0 if norm1.zero? || norm2.zero?
      dot / (norm1 * norm2)
    end
  end
end