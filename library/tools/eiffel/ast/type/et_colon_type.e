indexing

	description:

		"Eiffel types preceded by a colon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_COLON_TYPE

inherit

	ET_DECLARED_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_colon: like colon; a_type: like type) is
			-- Create a new colon-type.
		require
			a_colon_not_void: a_colon /= Void
			a_type_not_void: a_type /= Void
		do
			colon := a_colon
			type := a_type
		ensure
			colon_set: colon = a_colon
			type_set: type = a_type
		end

feature -- Access

	colon: ET_SYMBOL
			-- ':' symbol

	type: ET_TYPE
			-- Type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := colon.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := type.break
		end

feature -- Type processing

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): ET_COLON_TYPE is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		local
			a_type: ET_TYPE
		do
			a_type := type.resolved_formal_parameters (actual_parameters)
			if a_type /= type then
				create Result.make (colon, a_type)
			else
				Result := Current
			end
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENT_LIST; a_class: ET_CLASS): ET_COLON_TYPE is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
			-- (Warning: this is a side-effect function.)
		local
			a_type: ET_TYPE
		do
			a_type := type.resolved_identifier_types (a_feature, args, a_class)
			if a_type /= type then
				create Result.make (colon, a_type)
			else
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		local
			a_type: ET_TYPE
		do
			a_type := type.deep_cloned_type
			if a_type /= type then
				create Result.make (colon, a_type)
			else
				Result := Current
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_colon_type (Current)
		end

invariant

	colon_not_void: colon /= Void

end
