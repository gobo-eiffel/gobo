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
			(agent g).item ([])
		do
		end

feature {STRING}

	g: BOOLEAN
		do
			Result := True
		end
		
end
