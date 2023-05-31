class PationtForm
  include ActiveModel::Model 
  
  attr_accessor :name, :last_name, :id
  
  attr_reader :record
  def persist
    @record = id ? Pationt.find(id) : Pationt.new(name: name, last_name: last_name)
    if valid?
      @record.save!
        true
    else
        false 
    end 
  end 
end