list = STDIN.readlines

STDIN.close

require 'reline'

STDIN.reopen("/dev/tty", "r")

last = ""
list.each do |item|
    if last == ""
        line = Reline.readline("What comes first? ", true)
    else
        line = Reline.readline("What comes after #{last}? ", true)
    end
    if line.nil? || line.strip.downcase != item.strip.downcase
        puts "Wrong! The correct answer was #{item.strip}."
        exit
    end
    last = item.strip
end

puts "Congratulations! You got them all right!"