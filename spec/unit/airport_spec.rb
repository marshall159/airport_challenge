require 'airport'

describe Airport do
    let(:plane) { double("Plane") }

    describe "#land" do
        it "returns the plane which has landed" do
            expect(subject.land(plane)).to eq(plane) 
        end
    end

    describe "#planes" do
        it "is initially empty" do 
            expect(subject.planes).to be_empty
        end

        it "contains the landed planes in the airport" do
            subject.land(plane)

            expect(subject.planes).to include(plane)
        end
    end
   
end