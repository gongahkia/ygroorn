require 'thor'
require_relative 'core'
require_relative 'traits'

module Ygroorn
  class CLI < Thor
    desc "generate DESCRIPTION", "Generate creative GitHub repo names"
    option :vibe,     default: "playful",  desc: "Vibe (#{Traits::VIBES.join(', ')})"
    option :theme,    default: "tech",     desc: "Theme (#{Traits::THEMES.join(', ')})"
    option :language, default: "English",  desc: "Language (#{Traits::LANGUAGES.join(', ')})"
    option :n,        default: 5,          desc: "Number of suggestions", type: :numeric

    def generate(description)
      names = Core.generate_repo_names(
        description,
        options[:vibe],
        options[:theme],
        options[:language],
        options[:n].to_i
      )
      names.each_with_index do |name, idx|
        puts "#{idx + 1}. #{name}"
      end
    end
  end
end