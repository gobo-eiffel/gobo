note

	description:

		"Builders for lists of type definitions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_TYPE_DEFINITION_BUILDER

feature -- Basic operations

	add_class (a_class: ET_CLASS; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add class `a_class` to the list of type definitions.
		require
			a_class_not_void: a_class /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_formal_parameter (a_formal_parameter: ET_FORMAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal paramater `a_formal_parameter` to the list of type definitions.
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

end
