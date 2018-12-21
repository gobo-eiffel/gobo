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
			g
		do
		end

feature {STRING}

	g: BOOLEAN
		do
			Result := True
		end
		
end
