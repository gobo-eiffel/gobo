class CC

create

	make

feature

	make
		do
		end

	f (i: INTEGER)
		do
			if i = 1 then
				print ("DD calling CC.f%N")
				{SCHEDULER}.set_value (1)
			else
				print ("EE calling CC.f%N")
				{SCHEDULER}.wait_for_value_with_timeout (2, 100_000_000)
				{SCHEDULER}.set_value (3)
			end
		end

end
