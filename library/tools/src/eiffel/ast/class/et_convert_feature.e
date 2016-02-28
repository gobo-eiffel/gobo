note

	description:

		"Eiffel conversion features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONVERT_FEATURE

inherit

	ET_CONVERT_FEATURE_ITEM

feature -- Initialization

	reset
			-- Reset convert feature as it was when it was last parsed.
		do
			name.reset
			types.reset
		end

feature -- Status report

	is_convert_from: BOOLEAN
			-- Is it a conversion from another type?
		do
			-- Result := False
		end

	is_convert_to: BOOLEAN
			-- Is it a conversion to another type?
		do
			-- Result := False
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Name of conversion feature

	types: ET_TYPE_LIST
			-- Conversion types

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := name.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := name.first_leaf
		end

	convert_feature: ET_CONVERT_FEATURE
			-- Conversion feature in comma-separated list
		do
			Result := Current
		end

invariant

	name_not_void: name /= Void
	types_not_void: types /= Void

end
