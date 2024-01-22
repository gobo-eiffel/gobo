class CC

inherit

	BB
		redefine
			f
		end

create

	make

feature

	f: NATURAL_16
		do
			print ("CC.f%N")
			Result := region_id (create {STRING_8}.make (0))
		end

end
