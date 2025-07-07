require 'unicode'

module Ygroorn
  module Utils
    def self.clean_text(text)
      Unicode.normalize_KD(text)
             .gsub(/[^\w\s-]/, '')
             .strip
             .downcase
    end

    def self.slugify(text, language)
      clean_text(text).gsub(/\s+/, '-')
    end
  end
end