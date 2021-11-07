class BB

feature

	g
		do
			print ("First call to f%N")
			f (False)
			if attached other_thread as l_other_thread then
				l_other_thread.join
			end
		end
		
	f (a_recursive_call: BOOLEAN)
		local
			l_other_thread: CC
			i: INTEGER
		once ("OBJECT")
			print ("Calling f%N")
			if not a_recursive_call then
				create l_other_thread.make (Current)
				other_thread := l_other_thread
				l_other_thread.launch
				from
					i := 20
				until
					i < 0
				loop
					if other_thread_launched then
						if not l_other_thread.join_with_timeout (1000) then
							print ("Second call was block by first call%N")
						end
						i := 0
					else
						{EXECUTION_ENVIRONMENT}.sleep (500_000_000)
					end
					i := i - 1
				end
			end
			print ("End of first call to f%N")
		end

	other_thread: detachable CC
	
	other_thread_launched: BOOLEAN

	set_other_thread_launched (b: BOOLEAN)
		do
			other_thread_launched := b
		end

end
