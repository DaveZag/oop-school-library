require 'json'

def open_file(path)
  if File.exist?(path)
    json_string = File.read(path)
    data = json_string != '' && json_string != "null" ? JSON.parse(json_string) : []
    data
  else
    return 'NOT FOUND'
  end
end
