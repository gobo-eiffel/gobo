class CC

create

	make

feature

	make
		do
		end

	f (i: INTEGER)
		do
			{EXECUTION_ENVIRONMENT}.sleep (400_000_000)
			if i = 1 then
				print ("DD calling CC.f%N")
			else
				print ("EE calling CC.f%N")
			end
		end

end
