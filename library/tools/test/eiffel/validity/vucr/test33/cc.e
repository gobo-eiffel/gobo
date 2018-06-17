class CC

inherit

	BB
		redefine
			f
		end

feature

	f: BOOLEAN
		do
			Result := Current /= Void
		end

end
