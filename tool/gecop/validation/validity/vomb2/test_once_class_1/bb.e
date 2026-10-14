once class BB

create

	f

feature

	f
		once
		end

	g: BB
		once
			Result := {BB}.f
		ensure
			class
		end

end
