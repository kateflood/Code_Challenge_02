# this is to load in the test files?
require_relative '../spec/analyze_spec.rb'

class TheBody
	def initialize(input_file)
		@histogram = {}
		$STDIN
	end

	def reading_rainbow(input_file)
		while line = input_file.gets do
			case ARGV[0]
			  when '-p'
			    @histogram.push(line[/\A\w*\.?/])
			  when '-s'
			    @histogram.push(line[/\w*\z/])
			  else
			    puts "unknown option"
			    puts "usage: analyze.rb -p | -s < input_file > output_file"
			    exit
			end
		end
	end

	@histogram.to_a.sort! {|a, b| a[1] <=> b[1]}
end

f = File.open("../spec/testfile.txt")

histogram_text = TheBody.new


f.close


#begin sudo code
#Open the files created in analyze_spec.rb
#Read the files into an array (this may be the same as the first step)
#Create a class that iterates over the array
#create two conditions for prefixes and suffixes
#create a regex for the prefixes
#create a regex for the suffixes
#end
