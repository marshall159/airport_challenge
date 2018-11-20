# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and 
# confirm that it is no longer in the airport

describe 'Take Off' do
    it 'instructs a plane to take off from an airport' do
        given_there_is_an_airport
        and_there_is_a_plane_at_the_airport
        when_the_plane_is_instructed_to_take_off
        then_the_plane_should_no_longer_be_in_the_airport
    end

    def given_there_is_an_airport
        @airport = Airport.new 
    end

    def and_there_is_a_plane_at_the_airport
        @plane = Plane.new
        @airport.land(@plane) 
    end

    def when_the_plane_is_instructed_to_take_off
    end

    def then_the_plane_should_no_longer_be_in_the_airport
    end
end