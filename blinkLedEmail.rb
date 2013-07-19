require "arduino"
require "debugger"
require './weather_reader'

board = Arduino.new("/dev/tty.usbmodemfd111") # 115200 bauds
sp = SerialPort.new("/dev/tty.usbmodemfd111", 115200)

# Declare output pins
board.output(9)
weather_reader = WeatherReader.new

# Waits for incoming emails

while true do
  begin
    puts "Which city do you want to check?"
    puts "1: helsinki, 2: singapore, 3: cairo, 4: tokyo, 5: buenos_aires, 6: bali, 7: sapporo, 8:milano"
    city = gets  
    mt = weather_reader.fetch_temperature(city)  
    puts "Temperature is #{mt}"
    board.analogWrite(9, mt) 
    board.setHigh(13)
  rescue SignalException => e
    puts "Bye bye"
    return
  rescue Exception => e
    puts "WOAH! there was an error, do you want to try again?"
  end  
end