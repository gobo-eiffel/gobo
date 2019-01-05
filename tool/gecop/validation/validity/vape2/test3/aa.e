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
			(agent: BOOLEAN do Result := g (create {BB}.make) end).item ([])
		do
			print ("Failed")
		end

	g (b: BB): BOOLEAN
		do
			Result := True
		end

end
