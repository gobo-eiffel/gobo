class CC

inherit

	BB
		redefine
			f
		end

feature

	f: BOOLEAN
		note
			option: "instance_free"
		do
			Result := Precursor
		end

end
