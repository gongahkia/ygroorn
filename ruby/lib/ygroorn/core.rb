require_relative 'traits'
require_relative 'naming'
require_relative 'embeddings'
require_relative 'utils'

module Ygroorn
  module Core
    def self.generate_repo_names(description, vibe, theme, language, n = 5)
      profile = Traits.get_trait_profile(vibe, theme, language)
      desc_vec = Embeddings.get_embedding(Utils.clean_text(description), language)
      candidates = Naming.suggest_names(profile, language)
      scored = candidates.map do |name|
        name_vec = Embeddings.get_embedding(name, language)
        [name, Embeddings.cosine_similarity(desc_vec, name_vec)]
      end
      scored.sort_by { |_, score| -score }.first(n).map(&:first)
    end
  end
end