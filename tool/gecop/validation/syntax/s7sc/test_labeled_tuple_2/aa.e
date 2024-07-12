class AA

create

	make

feature

	make
		local
			t: TUPLE [
				a: INTEGER
				b: INTEGER
			]
		do
			t := [1, 2]
			print ("Passed")
		end

end
