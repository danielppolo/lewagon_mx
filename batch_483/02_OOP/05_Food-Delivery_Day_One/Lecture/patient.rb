class Patient
  attr_reader :first_name, :last_name, :blood_type, :cured
  attr_accessor :room, :id
  def initialize(attributes = {})
    @first_name = attributes[:first_name]
    @cured = attributes[:cured] || false
    @last_name = attributes[:last_name]
    @blood_type = attributes[:blood_type]
    @room = attributes[:room]
    @id = attributes[:id]
  end

  def cure
    @cured = true
  end

  def cured?
    @cured
  end 
end
