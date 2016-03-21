 # require 'pry'

class LoadBalance

	def initialize(args_hash={})
		@a = []
	end

	def allot_load(a)

		num_nodes = a.length
		max = a.max
		index = a.index(max)
		count = 0
		if (a[index-1] == 0) && (a[index+1] == 0)
			count = count+2
		elsif (a[index-1]!= 0) && (a[index+1] == 0)
			count = count+1
		elsif (a[index-1]== 0) && (a[index+1]!= 0)
			count = count+1
		else
			count = 0
		end
		
		neighbours = count
		max_load_per_node = a.max.to_f/(num_nodes)
		if (count!=0)
			total_seconds = neighbours*max_load_per_node+max_load_per_node*(num_nodes-(2*neighbours+1)) 
			puts "Total Seconds:"  "#{total_seconds}" 
		else
			puts "Total Seconds:"  "0" 
		end
	end

	def user_input

		puts "Enter number of digits"
		result = gets.chomp
		begin
		  result = Integer(result)
		rescue ArgumentError, TypeError
		  result = ''
		  # handle error, maybe call `exit`? 
		end
		unless result == ''  || result == 0
			result.times do
				input = gets.chomp.to_i
				@a << input
			end
			allot_load(@a)
		else
		  puts "Invalid input."    

		end

	end
end


obj = LoadBalance.new
obj.user_input


