require 'weather'

describe Weather do
    subject(:weather) { described_class.new }

    describe "#stormy?" do 
        it "returns whether the weather is stormy" do
            expect(weather).to respond_to(:stormy?)
        end

        # MOVE THESE TESTS INTO AIRPORT AND MOCK WEATHER

        context "sunny weather" do
            it "returns false" do
                allow(weather).to receive(:stormy?).and_return(false)

                expect(weather.stormy?).to eq(false)
            end
        end

        context "stormy weather" do
            it "returns true" do
                allow(weather).to receive(:stormy?).and_return(true)

                expect(weather.stormy?).to eq(true)
            end
        end
    end
end