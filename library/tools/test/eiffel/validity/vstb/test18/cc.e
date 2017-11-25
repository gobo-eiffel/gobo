class CC

inherit

	BB
		redefine
			f
		end

feature

	f
		note
			option: "instance_free"
		do
			Precursor
		end

end
