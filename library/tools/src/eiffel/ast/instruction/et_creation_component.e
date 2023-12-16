note

	description:

		"Eiffel creation components (either creation instructions or expressions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_COMPONENT

inherit

	ET_SEPARATE_CALL
		rename
			target as separate_target
		end

feature -- Access

	type: detachable ET_TYPE
			-- Creation type
		deferred
		end

	creation_call: detachable ET_CREATION_CALL
			-- Call to creation procedure
		deferred
		end

	separate_target: ET_IDENTIFIER
			-- Target used internally in SCOOP mode when the creation type is separate
		do
			if attached internal_separate_target as l_internal_separate_target then
				Result := l_internal_separate_target
			else
				create Result.make (tokens.separate_keyword.text)
				internal_separate_target := Result
			end
		end

	name: ET_FEATURE_NAME
			-- Creation procedure name.
			-- Use version of 'ANY.default_create' in the creation type
			-- when there is no `creation_call'.
		local
			l_name: ET_IDENTIFIER
			l_name_position: ET_POSITION
		do
			if attached creation_call as l_creation_call then
				Result := l_creation_call.name
			elseif attached default_create_name as l_default_create_name then
				Result := l_default_create_name
			else
				create l_name.make (tokens.default_create_feature_name.name)
				l_name_position := last_position
				l_name.set_position (l_name_position.line, l_name_position.column)
				default_create_name := l_name
				Result := l_name
			end
		end

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments of creation call
		do
			if attached creation_call as l_creation_call then
				Result := l_creation_call.arguments
			end
		end

feature {NONE} -- Implementation

	default_create_name: detachable like name
			-- Name used when there is no explicit `creation_call'.
			-- Use version of 'ANY.default_create' in the creation type in that case.

	internal_separate_target: detachable like separate_target
			-- Target used internally in SCOOP mode when the creation type is separate

end
