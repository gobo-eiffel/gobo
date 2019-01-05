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
			$g /= default_pointer
		do
			print ("Failed")
		end

feature {STRING}

	g: BOOLEAN
		do
			Result := True
		end
		
end
