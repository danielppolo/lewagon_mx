require_relative 'patient'

class Room
  attr_reader :patients 
  attr_accessor :id, :capacity, :hospital
  
  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
    @hospital = attributes[:hospital]
    @id = attributes[:id]
  end

  def add_patient(instance_of_patient)
    @patients.push(instance_of_patient)
    instance_of_patient.room = self # Room instance
  end

  def remove_patient(index)
    @patients.delete_at(index)
  end

  def full?
    @capacity == @patients.length
  end
end

daniel = Patient.new({
  first_name: 'Daniel',
  last_name: 'Polo',
  blood_type: 'A+'
})

andrea = Patient.new({
  first_name: 'Andrea',
  last_name: 'Bazan',
  cured: true, 
  blood_type: 'A+'
})

patients = [daniel, andrea]

space = Room.new({
  capacity: 4,
  # patients: patients
})
space.add_patient(daniel)
first_patient = space.patients.first
first_patient_room = first_patient.room

p space
p first_patient_room