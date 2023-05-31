class PhysicianDecorator < BaseDecorator
    def full_name
      "#{name} #{last_name}"
    end 
end