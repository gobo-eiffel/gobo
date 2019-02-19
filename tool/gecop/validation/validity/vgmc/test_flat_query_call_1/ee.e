class EE

inherit

	CC
		redefine
			f
		end
	
	DD
		redefine
			f
		end

feature

	f: EE
		do
			create Result
		end

end
