# frozen_string_literal: true

# spec/pageview_calculator_spec.rb
require 'pageview_calculator'

describe PageviewCalculator do
  let(:calculator) { described_class.new('test.log') }

  describe '#list_most_viewed' do
    subject { calculator.list_most_viewed }
    it 'should return a list of web pages with the most page views' do
      expect(subject).to eq(['/products', '/home', '/faq', '/about'])
    end
  end

  describe '#list_most_unique' do
    subject { calculator.list_most_unique }
    it 'should return a list of unique page views' do
      expect(subject).to eq(['/home', '/products', '/about', '/faq'])
    end
  end
end
