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
			(agent: BOOLEAN do Result := {AA}.g end).item ([])
		do
			print ("Failed")
		end

feature {AA}

	g: BOOLEAN
		do
			Result := True
		ensure
			class
		end
		
end
