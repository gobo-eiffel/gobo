note

	description:

		"Eiffel closures with components common to extended attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTENDED_ATTRIBUTE_CLOSURE

inherit

	ET_INTERNAL_FEATURE_CLOSURE
		undefine
			type
		redefine
			type
		end

feature -- Access

	type: ET_TYPE
			-- Return type
		deferred
		ensure then
			type_not_void: Result /= Void
		end

end
