class DD

inherit

	ZZ
		redefine
			f
		end

feature

	f: DD
		do
			create Result
		end
end
