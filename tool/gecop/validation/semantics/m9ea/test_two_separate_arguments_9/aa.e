class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			{SCHEDULER}.set_value (1)
			create b.make
			{SCHEDULER}.wait_for_value (2)
			{EXCEPTIONS}.die (0)
		end

end
