# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

describe 'Airport Full' do
    it 'prevents a plane landing if the airport is full' do
        given_there_is_an_airport
        when_the_airport_is_full
        then_the_plane_should_not_be_able_to_land_at_the_airport
    end

    def given_there_is_an_airport
        @airport = Airport.new 
    end

    def when_the_airport_is_full
        @plane = Plane.new
        Airport::DEFAULT_CAPACITY.times { @airport.land(@plane) }
    end

    def then_the_plane_should_not_be_able_to_land_at_the_airport
        expect { @airport.land(@plane) }.to raise_error("Airport Full")
    end
end