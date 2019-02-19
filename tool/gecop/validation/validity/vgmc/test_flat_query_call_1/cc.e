class CC

inherit

	ZZ
		redefine
			f
		end

feature

	f: CC
		do
			create Result
		end

end
