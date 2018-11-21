class Airport
    attr_reader :planes, :capacity
    DEFAULT_CAPACITY = 30

    def initialize(weather = Weather.new)
        @planes = []
        @capacity = DEFAULT_CAPACITY
        @weather = weather 
    end

    def land(plane)
        raise("Cannot Land: Stormy Weather") if weather.stormy?
        raise("Cannot Land: Airport Full") if full?
        planes << plane 
        plane 
    end

    def take_off(plane)
        planes.delete(plane)
    end

    private

    attr_reader :weather 

    def full? 
        planes.count >= capacity
    end
end