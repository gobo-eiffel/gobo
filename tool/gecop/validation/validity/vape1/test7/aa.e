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
			(agent (a: AA): BOOLEAN do Result := a.g end).item ([b])
		do
			print ("Failed")
		end

feature {AA}

	g: BOOLEAN
		do
			Result := True
		end
		
end
