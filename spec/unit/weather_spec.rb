require 'weather'

describe Weather do
    subject(:weather) { described_class.new }

    describe "#stormy?" do 
        it "returns whether the weather is stormy" do
            expect(weather.stormy?).to eq(false) | eq(true)
        end
    end
end