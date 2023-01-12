require 'json'

def open_file(path)
  return 'NOT FOUND' unless File.exist?(path)

  json_string = File.read(path)
  json_string != '' && json_string != 'null' ? JSON.parse(json_string) : []
end
