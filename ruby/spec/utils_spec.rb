require 'ygroorn/utils'

RSpec.describe Ygroorn::Utils do
  it 'cleans text' do
    expect(described_class.clean_text('Hello, World!')).to eq('hello world')
  end

  it 'slugifies spaces' do
    expect(described_class.slugify('Hello World', 'English')).to eq('hello-world')
  end
end