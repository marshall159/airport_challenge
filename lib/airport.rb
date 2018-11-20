class Airport
    attr_reader :planes, :capacity
    DEFAULT_CAPACITY = 30

    def initialize 
        @planes = []
        @capacity = DEFAULT_CAPACITY
    end

    def land(plane)
        raise("Cannot Land: Airport Full") if full?
        planes << plane 
        plane 
    end

    def take_off(plane)
        planes.delete(plane)
    end

    private

    def full? 
        planes.count >= capacity
    end
end