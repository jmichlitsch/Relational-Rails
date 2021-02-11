require 'rails_helper'

describe Vehicle, type: :model do
  describe 'relationships' do
    it { should belong_to :dealership}
  end
  describe 'class methods' do
    describe 'does_have_auto_transmission' do
      it 'returns only vehicles with auto transmission' do
        dealership1 = Dealership.create(name: "joes",
                                  max_inventory: 150,
                                  in_county: false)
        vehicle1 = dealership1.vehicles.create(name: "S Class",
                                             passenger_limit: 5,
                                             auto_transmission: true)
        vehicle2 = dealership1.vehicles.create(name: "E Class",
                                             passenger_limit: 5,
                                              auto_transmission: false)
      expect(Vehicle.does_have_auto_transmission).to eq([vehicle1])
      end
    end

    describe 'limit_passengers' do
      it 'filters for passengers' do
        dealership1 = Dealership.create(name: "joes",
                                  max_inventory: 150,
                                  in_county: false)
        vehicle1 = dealership1.vehicles.create(name: "S Class",
                                             passenger_limit: 3,
                                             auto_transmission: true)
        vehicle2 = dealership1.vehicles.create(name: "E Class",
                                             passenger_limit: 6,
                                              auto_transmission: true)
      holder = nil
      expect(Vehicle.limit_passengers(holder)).to eq([vehicle1,vehicle2])
      expect(Vehicle.limit_passengers(5)).to eq([vehicle2])
      end
    end

    describe 'alphabetize' do
      it 'displays boards in alphabetical order' do
        dealership1 = Dealership.create(name: "joes",
                                  max_inventory: 150,
                                  in_county: false)
        vehicle1 = dealership1.vehicles.create(name: "S Class",
                                             passenger_limit: 5,
                                             auto_transmission: true)
        vehicle2 = dealership1.vehicles.create(name: "E Class",
                                             passenger_limit: 5,
                                              auto_transmission: true)
      holder = nil
      expect(Vehicle.alphabetize(holder)).to eq([vehicle1, vehicle2])
      holder = true
      expect(Vehicle.alphabetize(holder)).to eq([vehicle2, vehicle1])
      end
    end
  end
end
