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
			Result := region_id (Current)
		end

end
