class BB

create

	make

feature

	make
		do
		end

	f (i: INTEGER)
		do
			if i = 1 then
				print ("DD calling BB.f%N")
				{SCHEDULER}.wait_for_value_with_timeout (3, 100_000_000)
			else
				print ("EE calling BB.f%N")
			end
			{SCHEDULER}.set_value (2)
		end

end
