class AA

create

	make

feature

	make
		do
			f
		end

feature {ANY}

	f
		require
			g (create {BB})
		do
			print ("Failed")
		end

	g (b: BB): BOOLEAN
		do
			Result := True
		end

end
