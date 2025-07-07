module Ygroorn
  module Embeddings
    VECTOR_SIZE = 300

    def self.get_embedding(text, language)
      seed = text.each_byte.sum
      Array.new(VECTOR_SIZE) { Math.sin(seed += 1) % 1 }
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