# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

describe 'Land' do
    it 'lands a plane at an airport' do
        given_there_is_a_plane
        and_there_is_an_airport
        when_the_plane_is_instructed_to_land
        then_the_plane_should_land
    end

    def given_there_is_a_plane
        @plane = Plane.new
    end

    def and_there_is_an_airport
        @airport = Airport.new 
    end

    def when_the_plane_is_instructed_to_land
        @airport.land(@plane) 
    end

    def then_the_plane_should_land
        expect(@airport.planes).to include(@plane)
    end
end
