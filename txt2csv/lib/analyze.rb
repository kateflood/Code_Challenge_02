require "pry"
#create Hash to store patterns and counts - create with default
histogram_hash = Hash.new(0)

#Add case statement to check to see if you are looking for prefixes or suffixes
case ARGV[0]
  when '-p'
    # set up some regular expression for prefixes
    pattern = %r{^\S+}
  when '-s'
    # set up some regular expression for suffixes
    pattern = %r{\S+$}
  else
    puts "unknown option"
    puts "usage: analyze.rb -p | -s < input_file > output_file"
    exit
end

ARGV.shift

ARGF.readlines.each { |line| histogram_hash[pattern.match(line)[0]] += 1 }

#sort hash from largest to smallest value
histogram_hash = histogram_hash.sort_by { |a, b| b}
histogram_hash.reverse!

#print hash to a new file called histogram with each key and value on separate line
histogram_hash.each { |k,v| puts "#{k} #{v}" }