require "socket"
require "pry"

def parse_request(request_line)
  http_method, path_and_params, _http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = params.split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  next if !request_line || request_line =~ /favicon/

  _http_method, _path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts roll
  end

  client.close
end
