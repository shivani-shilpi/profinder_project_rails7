class PationtPresenter 
    def initialize(pationt)
        @pationt = pationt
    end

    def full_name
        "#{@pationt.name} #{@pationt.last_name}"
    end
end