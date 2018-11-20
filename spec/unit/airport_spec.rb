require 'airport'

describe Airport do
    subject(:airport) { described_class.new }
    let(:plane) { double("Plane") }

    describe "#land" do
        it "returns the plane which has landed" do
            expect(airport.land(plane)).to eq(plane) 
        end
    end

    describe "#planes" do
        it "is initially empty" do 
            expect(airport.planes).to be_empty
        end

        it "contains the landed planes in the airport" do
            airport.land(plane)

            expect(airport.planes).to include(plane)
        end
    end

    describe "#take_off" do
        it "removes the plane from the airport" do
            airport.land(plane)
            airport.take_off(plane)

            expect(airport.planes).not_to include(plane)
        end

        it "returns the removed plane" do 
            airport.land(plane)
            plane_taken_off = airport.take_off(plane)

            expect(plane_taken_off).to eq(plane)
        end
    end
   
end