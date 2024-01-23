class BB

inherit

	ISE_SCOOP_RUNTIME

create

	make

feature

	make
		do
		end

	f: NATURAL_16
		do
			print ("BB.f%N")
			Result := region_id (create {STRING_8}.make (0))
		end

end
