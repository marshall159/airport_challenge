# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

describe 'Stormy Takeoff' do
    it 'prevents a plane taking off when weather is stormy' do
        given_there_is_an_airport
        and_there_is_a_plane_at_the_airport
        when_weather_is_stormy
        then_plane_should_not_take_off
    end

    def given_there_is_an_airport
        @weather = double("Weather", stormy?: false)
        @airport = Airport.new(@weather)
    end

    def and_there_is_a_plane_at_the_airport
        @plane = Plane.new 
        @airport.land(@plane)
    end

    def when_weather_is_stormy
        allow(@weather).to receive(:stormy?).and_return(true)
    end

    def then_plane_should_not_take_off
        expect { @airport.take_off(@plane) }.to raise_error("Cannot Take Off: Stormy Weather")
    end
end