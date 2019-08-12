require 'rental.rb'

RSpec.describe Rental do
  let(:price) { RegularPrice.new }
  let!(:movie) { Movie.new('memento', price) }
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

  describe '#charge' do
    context '借りる映画の種類が「一般」で、貸し出し日数が2日のとき' do
      let!(:price) { RegularPrice.new }
      let!(:days_rented) { 2 }

      it 'レンタル料金が2ドルになること' do
        # NOTE: 計算式は '2 + (days_rented - 2) * 1.5'
        expect(rental.charge).to eq 2
      end
    end

    context '借りる映画の種類が「一般」で、貸し出し日数が7日のとき' do
      let!(:price) { RegularPrice.new }
      let!(:days_rented) { 7 }

      it 'レンタル料金が9.5ドルになること' do
        # NOTE: 計算式は '2 + (days_rented - 2) * 1.5'
        expect(rental.charge).to eq 9.5
      end
    end

    context '借りる映画の種類が「新作」のとき' do
      let!(:price) { NewReleasePrice.new }

      it 'レンタル料金が21ドルになること' do
        # NOTE: 計算式は 'days_rented * 3'
        expect(rental.charge).to eq 21
      end
    end

    context '借りる映画の種類が「子供向け」で、貸し出し日数が3日のとき' do
      let!(:price) { ChildrenPrice.new }
      let!(:days_rented) { 3 }

      it 'レンタル料金が1.5ドルになること' do
        # NOTE: 計算式は '1.5 + (days_rented - 3) * 1.5'
        expect(rental.charge).to eq 1.5
      end
    end

    context '借りる映画の種類が「子供向け」で、貸し出し日数が7日のとき' do
      let!(:price) { ChildrenPrice.new }
      let!(:days_rented) { 7 }

      it 'レンタル料金が7.5ドルになること' do
        # NOTE: 計算式は '1.5 + (days_rented - 3) * 1.5'
        expect(rental.charge).to eq 7.5
      end
    end
  end
end
