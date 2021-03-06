class BB

inherit

	THREAD

create

	make

feature
	
	execute
		do
			print ("Second call to f%N")
			print ("Value of second call: " + f (True) + "%N")
			print ("End of second call to f%N")
		end

	g
		do
			print ("First call to f%N")
			print ("Value of first call: " + f (False) + "%N")
			if attached other_thread as l_other_thread then
				l_other_thread.join
			end
		end
		
	f (a_recursive_call: BOOLEAN): STRING
		local
			l_other_thread: BB
		once ("PROCESS")
			print ("Calling f%N")
			Result := "foo"
			if not a_recursive_call then
				create l_other_thread.make
				other_thread := l_other_thread
				l_other_thread.launch
				if not l_other_thread.join_with_timeout (1000) then
					print ("Second call was block by first call%N")
				end
			end
			Result := "bar"
			print ("End of first call to f%N")
		end

	other_thread: detachable BB
	
end
