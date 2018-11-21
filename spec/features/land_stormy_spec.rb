# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

describe 'Stormy Landing' do
    it 'prevents a plane landing when weather is stormy' do
        given_there_is_an_airport
        and_there_is_a_plane
        then_plane_should_not_land_when_weather_is_stormy
    end

    def given_there_is_an_airport
        @weather = double("Weather", stormy?: true)
        @airport = Airport.new(@weather)
    end

    def and_there_is_a_plane
        @plane = Plane.new 
    end

    def then_plane_should_not_land_when_weather_is_stormy
        expect { @airport.land(@plane) }.to raise_error("Cannot Land: Stormy Weather")
    end
end