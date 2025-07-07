require 'ygroorn'

RSpec.describe Ygroorn do
  it 'generates the expected number of repo names' do
    names = Ygroorn.generate_repo_names('A fun AI project', 'playful', 'tech', 'English', 3)
    expect(names.length).to eq(3)
    expect(names.all? { |n| n.is_a?(String) }).to be true
  end
end