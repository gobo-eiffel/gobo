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
			(agent: BOOLEAN
				do
					g
					Result := True 
				end).item ([])
		do
			print ("Failed")
		end

feature {AA}

	g
		do
		end
		
end
