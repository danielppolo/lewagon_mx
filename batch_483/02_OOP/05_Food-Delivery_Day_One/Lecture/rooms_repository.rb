require 'csv'
require_relative 'room'

class RoomsRepository
  def initialize(attributes = {})
    @file_path = attributes[:file_path]
    @room_list = []
    @next_id = 1
    load_csv
  end

  def add(room_instance)
    room_instance.id = @next_id
    @room_list << room_instance
    @next_id += 1
    save_csv
  end

  def find(id)
    return @room_list.find do |room|
      room.id == id
    end
  end

  private

  def save_csv
    CSV.open(@file_path, 'wb') do |file|
      file << %w[id capacity hospital]
      @room_list.each do |room|
        file << [room.id, room.capacity, room.hospital]
      end
    end
  end

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @room_list << Room.new(row)
      @next_id = row[:id] + 1
    end    
  end
end
