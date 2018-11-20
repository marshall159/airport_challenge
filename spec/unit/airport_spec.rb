require 'airport'

describe Airport do
    let(:plane) { double("Plane") }

    it { is_expected.to respond_to(:land).with(1).argument }

    it "#land returns the plane which has landed" do
        expect(subject.land(plane)).to eq(plane) 
    end
end