require 'rails_helper'

describe Shop, type: :model do
  describe 'relationships' do
    it { should have_many :snowboards}
  end

  describe 'class methods' do
    describe 'recent_created_by' do
      it 'sorts by most recently created' do
        shop1 = Shop.create(name: "joes",
                             square_footage: 150,
                             parking_lot: true)
        shop2 = Shop.create(name: "harrys",
                             square_footage: 150,
                             parking_lot: true)
      expect(Shop.recent_created_by).to eq([shop2, shop1])
      end
    end

    describe 'sort_by_children' do
      it 'sorts by highest child count' do
        shop1 = Shop.create(name: "joes",
                                        square_footage: 150,
                                        parking_lot: true)
        shop2 = Shop.create(name: "harrys",
                                        square_footage: 150,
                                        parking_lot: true)
        vehicle1 = shop2.snowboards.create(name: "S Class",
                                           length: 5,
                                           wide_stance: true)
      expect(Shop.sort_by_children("child")).to eq([shop2, shop1])
      end
    end
  end

  describe 'instance methods' do
    describe '#child_count' do
      it 'returns number of snowboards' do
        shop1 = Shop.create(name: "joes",
                                  square_footage: 150,
                                  parking_lot: false)
        snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                             length: 5,
                                             wide_stance: true)
        snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                             length: 5)
      expect(shop1.child_count).to eq(2)
      end
    end
  end
end
