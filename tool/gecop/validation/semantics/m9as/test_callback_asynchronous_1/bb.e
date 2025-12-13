class BB

create

	make

feature

	make (a: separate AA)
		do
			attr := a
		end
	
	attr: separate AA

	g
		do
			{SCHEDULER}.wait_for_value (1)
			separate attr as a do
				a.h
			end
			print ("End of BB.g%N")
			{SCHEDULER}.set_value (2)
		end

end
