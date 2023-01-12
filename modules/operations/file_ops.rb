require 'json'

def open_file(path)
  if File.exist?(path)
    json_string = File.read(path)
    json_string != '' && json_string != 'null' ? JSON.parse(json_string) : []
  else
    File.new(path, 'w')
    []
  end
end
