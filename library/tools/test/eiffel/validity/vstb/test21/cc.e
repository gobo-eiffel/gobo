class CC

inherit

	BB
		redefine
			f
		end

feature

	f: DD
		note
			option: instance_free
		do
			Precursor (5)
			create Result
		end

end
