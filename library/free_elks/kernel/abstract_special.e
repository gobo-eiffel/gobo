indexing
	description: "Ancestor of SPECIAL to perform queries on SPECIAL without knowing its actual generic type."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ABSTRACT_SPECIAL

feature -- Measurement

	count: INTEGER is
			-- Count of special area		
		deferred
		ensure
			count_non_negative: Result >= 0
		end

end
