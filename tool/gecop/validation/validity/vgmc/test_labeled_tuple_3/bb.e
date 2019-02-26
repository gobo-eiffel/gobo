class BB [G -> {detachable TUPLE [f: INTEGER], detachable CC}]

feature

	f (a: detachable G)
		local
			i: INTEGER
		do
			if a /= Void then
				i := a.f
			end
		end

end
