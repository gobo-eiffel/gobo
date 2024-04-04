class BB

create

	make

feature

	make
		do
		end

	f (i: INTEGER)
		do
			{EXECUTION_ENVIRONMENT}.sleep (500_000_000)
			if i = 1 then
				print ("DD calling BB.f%N")
			else
				print ("EE calling BB.f%N")
			end
		end

end
