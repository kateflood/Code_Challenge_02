require "pry"
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

#create Hash to store patterns and counts - create with default
h = Hash.new(0)

#Open up file, read through it checking for regex pattern on each line
	ARGF.readlines.each do |line|
		m = pattern.match(line)
		if m
			h[m[0]] += 1
		end
	end


#sort hash from largest to smallest value
h = h.sort_by { |a, b| b}
h.reverse!

#print hash to a new file called histogram with each key and value on separate line
h.each { |k,v| puts "#{k} #{v}" }

