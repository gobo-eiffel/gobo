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
			(agent: BOOLEAN do Result := g end).item ([])
		do
			print (5)
		end

feature {STRING}

	g: BOOLEAN
		do
			Result := True
		end
		
end
