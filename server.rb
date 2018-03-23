require 'webrick'
require 'securerandom'
#require 'simplecov'
#SimpleCov.start

server = WEBrick::HTTPServer.new :Port => 5000

#Return a successful Hello World response.
server.mount_proc '/' do |request, response|
  style = '<style type="text/css" media="screen">'
  style += 'body { background-color: navy; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 250%; }'
  style += '</style>'
  
  message = 'Hello World - from the Monolith!'
  
  body = "<body>#{message}</body>"
  
  response.body = style + body
  sleep 0.125 + SecureRandom.random_number*0.250
end

##Return a successful Hello World response.
#server.mount_proc '/' do |request, response|
#  response.body = 'oHell, world!'
#  sleep 0.125 + SecureRandom.random_number*0.250
#end

#Return an error to help demonstrate monitoring capabilities
server.mount_proc '/error' do |request, response|
  response.status = 500
  response.body = 'Sorry we encountered an error.'
  sleep 1.0+SecureRandom.random_number
end

server.start