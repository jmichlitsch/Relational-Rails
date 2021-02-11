require 'rails_helper'

describe Dealership, type: :model do
  describe 'relationships' do
    it { should have_many :vehicles}
  end

  describe 'class methods' do
    describe 'recent_created_by' do
      it 'sorts by most recently created' do
        dealership1 = Dealership.create(name: "joes",
                                        max_inventory: 150,
                                        in_county: true)
        dealership2 = Dealership.create(name: "harrys",
                                        max_inventory: 150,
                                        in_county: true)
      expect(Dealership.recent_created_by).to eq([dealership2, dealership1])
      end
    end

    describe 'sort_by_children' do
      it 'sorts by highest child count' do
        dealership1 = Dealership.create(name: "joes",
                                        max_inventory: 150,
                                        in_county: true)
        dealership2 = Dealership.create(name: "harrys",
                                        max_inventory: 150,
                                        in_county: true)
        vehicle1 = dealership2.vehicles.create(name: "S Class",
                                               passenger_limit: 5,
                                               auto_transmission: true)
      expect(Dealership.sort_by_children("child")).to eq([dealership2, dealership1])
      end
    end 
  end

  describe 'instance methods' do
    describe '#child_count' do
      it 'returns number of vehicles' do
        dealership1 = Dealership.create(name: "joes",
                                  max_inventory: 150,
                                  in_county: false)
        vehicle1 = dealership1.vehicles.create(name: "S Class",
                                             passenger_limit: 5,
                                             auto_transmission: true)
        vehicle2 = dealership1.vehicles.create(name: "E Class",
                                             passenger_limit: 5,
                                              auto_transmission: true)
      expect(dealership1.child_count).to eq(2)
      end
    end
  end
end
