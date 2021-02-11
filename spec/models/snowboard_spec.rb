require 'rails_helper'

describe Snowboard, type: :model do
  describe 'relationships' do
    it { should belong_to :shop}
  end
  describe 'class methods' do
    describe 'wide_boards' do
      it 'returns only wide boards' do
        shop1 = Shop.create(name: "joes",
                                  square_footage: 150,
                                  parking_lot: false)
        snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                             length: 5,
                                             wide_stance: true)
        snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                             length: 5,
                                              wide_stance: false)
      expect(Snowboard.wide_boards).to eq([snowboard1])
      end
    end

    describe 'filter_length' do
      it 'filters for length' do
        shop1 = Shop.create(name: "joes",
                                  square_footage: 150,
                                  parking_lot: false)
        snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                             length: 100,
                                             wide_stance: true)
        snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                             length: 150,
                                              wide_stance: false)
      holder = nil
      expect(Snowboard.filter_length(holder)).to eq([snowboard1,snowboard2])
      expect(Snowboard.filter_length(110)).to eq([snowboard2])
      end
    end

    describe 'alphabetize' do
      it 'displays boards in alphabetical order' do
      shop1 = Shop.create(name: "joes",
                                square_footage: 150,
                                parking_lot: false)
      snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                           length: 5,
                                           wide_stance: true)
      snowboard2 = shop1.snowboards.create(name: "Dream 2",
                                           length: 5,
                                            wide_stance: false)
      holder = nil
      expect(Snowboard.alphabetize(holder)).to eq([snowboard1, snowboard2])
      holder = true
      expect(Snowboard.alphabetize(holder)).to eq([snowboard2, snowboard1])
      end
    end
  end
end
