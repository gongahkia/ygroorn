module Ygroorn
  module Traits
    VIBES = %w[playful serious minimal futuristic bold].freeze
    THEMES = %w[tech art science business education].freeze
    LANGUAGES = %w[English Spanish French German Japanese].freeze

    def self.get_trait_profile(vibe, theme, language)
      {
        vibe:     VIBES.include?(vibe) ? vibe : VIBES.first,
        theme:    THEMES.include?(theme) ? theme : THEMES.first,
        language: LANGUAGES.include?(language) ? language : LANGUAGES.first
      }
    end
  end
end