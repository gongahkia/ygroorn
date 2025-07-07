require_relative "ygroorn/core"
require_relative "ygroorn/traits"

module Ygroorn
  def self.generate_repo_names(*args)
    Core.generate_repo_names(*args)
  end

  VIBES = Traits::VIBES
  THEMES = Traits::THEMES
  LANGUAGES = Traits::LANGUAGES
end