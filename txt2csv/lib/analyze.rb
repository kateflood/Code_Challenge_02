require "pry"

case ARGV[0]
  when '-p'
    pattern = /^\S+/
  when '-s'
    pattern = /\S+$/
  else
    puts "unknown option"
    puts "usage: analyze.rb -p | -s < input_file > output_file"
    exit
end

hist_o_hash = Hash.new(0)
ARGV.clear
#ARGF.readlines.each { |line| hist_o_hash[pattern.match(line)[0]] += 1 }

while line = gets 
  hist_o_hash[pattern.match(line)[0]] += 1
end

hist_o_hash = hist_o_hash.sort_by { |a, b| b}
hist_o_hash.reverse!

hist_o_hash.each { |k,v| puts "#{k} #{v}" }