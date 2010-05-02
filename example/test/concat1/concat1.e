note

	description:

		"String concatenators"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class CONCAT1

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new string concatenator.
		do
		end

feature -- Basic operations

	concat (s1, s2: STRING): STRING
			-- Concatenate `s1' and `s2'.
		require
			s1_not_void: s1 /= Void
			s2_not_void: s2 /= Void
		do
			create Result.make (s1.count + s2.count)
			Result.append_string (s1)
			Result.append_string (s1)
		ensure
			concat_string_not_void: Result /= Void
		end

end
