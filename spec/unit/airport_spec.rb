require 'airport'

describe Airport do
    let(:plane) { double("Plane") }
    let(:weather) { double("Weather", stormy?: false) }
    subject(:airport) { described_class.new(weather) }

    describe "#land" do
        it "returns the plane which has landed" do
            expect(airport.land(plane)).to eq(plane)
        end

        context "when full" do
            it "raises an error" do
                airport.capacity.times { airport.land(plane) }
    
                expect { airport.land(plane) }.to raise_error("Cannot Land: Airport Full")
                expect(airport.planes.count).to eq(airport.capacity)
            end
        end

        context "stormy weather" do
            it "raises an error" do
                allow(weather).to receive(:stormy?).and_return(true)

                expect { airport.land(plane) }.to raise_error("Cannot Land: Stormy Weather")
            end
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

        context "stormy weather" do
            it "raises an error" do
                allow(weather).to receive(:stormy?).and_return(true)

                expect { airport.take_off(plane) }.to raise_error("Cannot Take Off: Stormy Weather")
            end
        end
    end
   
end