class CC

inherit

	BB
		redefine
			f
		end

feature

	f: INTEGER
		do
				-- It's OK to call 'Precursor' because it's
				-- an instance-free feature in BB.
			Result := Precursor
		end

end
