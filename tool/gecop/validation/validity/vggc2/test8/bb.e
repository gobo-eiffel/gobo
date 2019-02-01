class BB [G -> detachable NONE rename default_create as g end]

feature

	f (a: G)
		do
			if a /= Void then
				a.g
			end
		end

end
