note

	description:

		"Eiffel choices in 'when' parts of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHOICE

inherit

	ET_CHOICE_ITEM

feature -- Initialization

	reset
			-- Reset choice as it was when it was last parsed.
		do
		end

feature -- Status report

	is_range: BOOLEAN
			-- Is current choice a range?
		do
			-- Result := False
		end
feature -- Access

	lower: ET_CHOICE_CONSTANT
			-- Lower bound
		deferred
		ensure
			lower_not_void: Result /= Void
		end

	upper: ET_CHOICE_CONSTANT
			-- Upper bound
		deferred
		ensure
			upper_not_void: Result /= Void
		end

	choice: ET_CHOICE
			-- Choice in comma-separated list
		do
			Result := Current
		end

end
