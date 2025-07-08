require 'ygroorn/naming'
require 'ygroorn/traits'

RSpec.describe Ygroorn::Naming do
  it 'suggests names with traits' do
    profile = Ygroorn::Traits.get_trait_profile('playful', 'tech', 'English')
    names = described_class.suggest_names(profile, 'English')
    expect(names.any? { |n| n.include?('playful') || n.include?('tech') }).to be true
  end
end