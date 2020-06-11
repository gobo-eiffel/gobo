class BB

feature
	
	execute
		do
			g
			g
		end

	f: STRING
		once ("OBJECT")
			print ("Calling f%N")
			check False then end
		end

	g
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
				print (f)
			end
		rescue
			if attached {EXCEPTION_MANAGER}.last_exception as l_last_exception then
				print (l_last_exception.generator)
				print ("%N")
			end
			l_retried := True
			retry
		end
		
end
