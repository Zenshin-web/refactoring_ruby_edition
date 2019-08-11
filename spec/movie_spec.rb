require 'movie.rb'

RSpec.describe Movie do
  let!(:title) { 'memento' }
  let!(:price_code) { 0 }
  let!(:movie) { Movie.new(title, price_code) }

  describe '#title' do
    it 'タイトル名が返ること' do
      expect(movie.title).to eq title
    end
  end

  describe '#price_code' do
    it 'プライスコードの数字が返ること' do
      expect(movie.price_code).to eq price_code
    end
  end
end
