class CC

inherit

	THREAD
		rename
			make as make_thread
		end

create

	make

feature
	
	make (a_b: BB)
		do
			b := a_b
			make_thread
		end

	b: BB

	execute
		do
			print ("Second call to f%N")
			print ("Value of second call: " + void_or_out (b.f (True)) + "%N")
			print ("End of second call to f%N")
		end	

	void_or_out (a: detachable ANY): STRING
		do
			if a /= Void then
				Result := a.out
			else
				Result := "Void"
			end
		end

end
