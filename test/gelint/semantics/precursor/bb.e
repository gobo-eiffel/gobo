class BB [G]

feature

	f: ARRAY [G] is
		do
			create Result.make (1, 2)
		ensure
			f_not_void: f /= Void
			f_count: f.count = 2
		end

end
