require 'movie.rb'

RSpec.describe Movie do
  let!(:title) { 'memento' }
  let!(:price) { RegularPrice.new }
  let!(:movie) { Movie.new(title, price) }

  describe '#title' do
    it 'タイトル名が返ること' do
      expect(movie.title).to eq title
    end
  end
end
