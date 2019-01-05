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
			a.g
		do
			print ("Failed")
		end

feature {AA}

	g: BOOLEAN
		do
			Result := True
		end
		
end
