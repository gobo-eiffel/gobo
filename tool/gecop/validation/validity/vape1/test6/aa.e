class AA

create

	make

feature

	make
		do
			f (Current)
		end

feature {ANY}

	f (a: AA)
		require
			(agent a.g).item ([])
		do
			print ("Failed")
		end

feature {AA}

	g: BOOLEAN
		do
			Result := True
		end
		
end
