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
			{AA}.g
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
