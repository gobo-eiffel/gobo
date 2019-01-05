class AA

create

	make

feature

	make
		do
			f (Current)
		end

feature {ANY}

	f (b: AA)
		require
			(agent (a: AA): BOOLEAN
				do
					a.g
					Result := True
				end).item ([b])
		do
			print ("Failed")
		end

feature {AA}

	g
		do
		end
		
end
