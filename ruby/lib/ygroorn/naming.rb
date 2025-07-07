require_relative 'utils'

module Ygroorn
  module Naming
    NAME_PATTERNS = [
      "%{vibe}%{theme}",
      "%{theme}%{vibe}",
      "%{vibe}-%{theme}",
      "%{theme}-%{vibe}",
      "%{vibe}%{theme}hub",
      "%{theme}%{vibe}lab"
    ].freeze

    def self.suggest_names(profile, language)
      NAME_PATTERNS.map do |pattern|
        name = pattern % {
          vibe:  profile[:vibe].capitalize,
          theme: profile[:theme].capitalize
        }
        Utils.slugify(name, language)
      end
    end
  end
end