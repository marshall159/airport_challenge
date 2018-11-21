require 'weather'

describe Weather do
    subject(:weather) { described_class.new }

    describe "#stormy?" do 
        context "weather is sunny" do
            it "returns false" do
                srand(1234)
                expect(weather.stormy?).to eq(false)
            end
        end
        
        context "weather is stormy" do
            it "returns true" do
                srand(2)
                expect(weather.stormy?).to eq(true)
            end
        end
    end
end