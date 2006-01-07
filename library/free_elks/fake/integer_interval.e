class
	INTEGER_INTERVAL

create
	make

feature {NONE} -- Initialization

	make (min_index, max_index: INTEGER) is
			-- Set up interval to have bounds `min_index' and
			-- `max_index' (empty if `min_index' > `max_index')
		do
			print ("INTEGER_INTERVAL.make called%N")
		end

end
