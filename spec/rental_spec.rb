require 'rental.rb'

RSpec.describe Rental do
  let!(:movie) { Movie.new('memento', 0) }
  let!(:days_rented) { 7 }
  let!(:rental) { Rental.new(movie, days_rented) }

  describe '#movie' do
    it 'レンタルされる映画が返ること' do
      expect(rental.movie).to eq movie
    end
  end

  describe '#days_rented' do
    it 'レンタル期間が返ること' do
      expect(rental.days_rented).to eq days_rented
    end
  end
end
