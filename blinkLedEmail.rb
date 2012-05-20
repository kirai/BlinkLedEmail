require "arduino"
require 'net/pop'

board = Arduino.new("/dev/tty.usbmodemfd131") # 115200 bauds

# Declare output pins
board.output(13)

# Waits for incoming emails
loop do
  Net::POP3.delete_all('pop3.mailgun.org', 110,
                       'postmaster@username.mailgun.org', 'password') do |m|
    m.pop do |chunk| 
       board.setHigh(13)
       sleep(1)
       board.setLow(13)
       sleep(1)
    end
  end
  sleep(1)
end
