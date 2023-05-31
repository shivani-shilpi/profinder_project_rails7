class FullName
    attr_reader :physician

    def initialize(physician)
        @physician = physician
    end
    
    def ==(other)
        self.class == other.class &&
        name == other.name &&
        last_name  == other.last_name ? 0 : -1
    end

    def first_name
        @physician.name
    end

    def last_name
        @physician.last_name
    end
    
    def to_s
        "#{first_name} #{last_name}"
    end

    def to_h
        { name: first_name, last_name: last_name } 
    end
end