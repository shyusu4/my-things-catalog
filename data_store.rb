require 'json'

class DataStore
  def initialize(file_name)
    @file_name = "#{file_name}.json"
    write([]) unless File.file?(@file_name)
  end

  def write(data)
    write = JSON.generate(data)
    File.write(@file_name, write)
  end

  def read
    read = File.read(@file_name)
    JSON.parse(read)
  end
end
