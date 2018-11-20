# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

describe 'Stormy Landing' do
    it 'prevents a plane landing when weather is stormy' do
        given_there_is_an_airport
        and_there_is_a_plane
        when_the_weather_is_stormy
        then_the_plane_should_not_be_able_to_land_at_the_airport
    end

    def given_there_is_an_airport
        @airport = Airport.new 
    end

    def and_there_is_a_plane
        @plane = Plane.new 
    end

    def when_the_weather_is_stormy
        @weather = Weather.new 
        @weather.stormy?
    end

    def then_the_plane_should_not_be_able_to_land_at_the_airport
        expect { @airport.land(@plane) }.to raise_error("Cannot Land: Stormy Weather")
    end
end