class AA

create

	make

feature

	make
		local
			c: CC
		do
			create c.make
			f (c)
		end

feature {ANY}

	f (c: CC)
		require
			g (c)
		do
			print ("Failed")
		end

	g (b: BB): BOOLEAN
		do
			Result := True
		end

end
