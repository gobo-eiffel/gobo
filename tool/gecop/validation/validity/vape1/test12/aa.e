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
			a (1)
		do
			print ("Failed")
		end

feature {AA}

	g alias "()" (i: INTEGER): BOOLEAN
		do
			Result := True
		end
		
end
