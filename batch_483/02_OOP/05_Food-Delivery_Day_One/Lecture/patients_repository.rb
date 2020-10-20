require 'csv'
require_relative 'patient'
require_relative 'rooms_repository'

class PatientsRepository
  def initialize(attributes = {})
    @file_path = attributes[:file_path]
    @patient_list = []
    @room_repository = RoomsRepository.new(file_path: 'data/rooms.csv')
    @next_id = 1
    load_csv
  end

  def add(patient_instance)
    patient_instance.id = @next_id
    @patient_list << patient_instance
    @next_id += 1
    save_csv
  end

  private

  def save_csv
    CSV.open(@file_path, 'wb') do |file|
      file << %w[id first_name last_name cured blood_type, room_id]
      @patient_list.each do |patient|
        file << [patient.id, patient.first_name, patient.last_name, patient.cured, patient.blood_type, patient.room.id]
      end
    end
  end

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    
    CSV.foreach(@file_path, csv_options) do |row|
      # FIND THE ROOM
      # I need to have a RoomRepository
      # I need to .find in the RoomRepository
      row[:room] = @room_repository.find(row[:room_id].to_i)
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      attributes = {
        id: row[:id],
        cured: row[:cured],
        first_name: row[:first_name],
        last_name: row[:last_name],
        blood_type: row[:blood_type],
        room: row[:room]
      }
      @patient_list << Patient.new(attributes)
      @next_id = row[:id] + 1
    end    
  end
end

repo = PatientsRepository.new(file_path: 'data/patients.csv')
p repo