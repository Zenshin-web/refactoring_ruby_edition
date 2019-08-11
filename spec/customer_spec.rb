require 'customer.rb'

RSpec.describe Customer do
  let!(:movie) { Movie.new('memento', 0) }
  let!(:rental) { Rental.new(movie, 7) }
  let!(:customer_name) { 'ken' }
  let!(:customer) { Customer.new(customer_name) }

  describe '#name' do
    it '顧客名が返ること' do
      expect(customer.name).to eq customer_name
    end
  end

  describe '#statement' do
    before { customer.add_rental(rental) }

    it '顧客の借りた映画のレシート情報が返ること' do
      receipt = "Rental Record for #{customer.name}\n\t#{movie.title}\t9.5\nAmount owed is 9.5\nYou earned 1 frequent renter points"
      expect(customer.statement).to eq receipt
    end
  end
end
