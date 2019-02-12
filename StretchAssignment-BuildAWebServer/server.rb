require 'socket'                                    # Require socket from Ruby Standard Library (stdlib)

host = 'localhost'
port = 2000

server = TCPServer.open(host, port)                 # Socket to listen to defined host and port
puts "Server started on #{host}:#{port} ..."        # Output to stdout that server started

loop do                                             # Server runs forever
  client = server.accept                            # Wait for a client to connect. Accept returns a TCPSocket

  lines = []
  while (line = client.gets) && !line.chomp.empty?  # Read the request and collect it until it's empty
    lines << line.chomp
  end
  puts lines                                        # Output the full request to stdout

  filename = lines[0].gsub(/GET \//, '').gsub(/\ HTTP.*/, '')
  filename = "index.html" unless filename != ""

  if File.exists?(filename)

    response_body = File.read(filename)

    success_header = []
    success_header << "HTTP/1.1 200 OK"
    success_header << "Content-Type: text/html"
    success_header << "Content-length: #{response_body.length}"
    success_header << "Connection: close"
    header = success_header.join("\r\n")

  else
    response_body = "File not found"

    not_found_header = []
    not_found_header << "HTTP/1.1 404 Not Found"
    not_found_header << "Content-Type: text/plain"
    not_found_header << "Content-Length: #{response_body.length}"
    not_found_header << "Connection: close"
    header = not_found_header.join("\r\n")
  end

  response = "#{header}\r\n\r\n#{response_body}"      # Output the HTTP header with current time to the client

  client.puts(response)

  client.close                                        # Disconnect from the client
end
