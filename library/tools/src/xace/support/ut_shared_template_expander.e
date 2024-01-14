note

	description:

		"Provides global access to a TEMPLATE_EXPANDER"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"

class UT_SHARED_TEMPLATE_EXPANDER

obsolete

	"Use KL_STRING_VALUES instead. [2019-03-17]"

feature -- Access

	template_expander: UT_TEMPLATE_EXPANDER
			-- Shared template expander
		once
			create Result.make
		ensure
			template_expander_not_void: Result /= Void
		end

end
