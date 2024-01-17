note

	description:

		"Eiffel procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_PROCEDURE

inherit

	ET_ROUTINE

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; a_class: like implementation_class)
			-- Create a new procedure.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			arguments := args
			end_keyword := tokens.end_keyword
			clients := tokens.empty_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			arguments_set: arguments = args
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Conversion

	undefined_feature (a_name: like extended_name): ET_DEFERRED_PROCEDURE
			-- Undefined version of current feature
		do
			create Result.make (a_name, arguments, implementation_class)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (Current)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_inline_separate_arguments (inline_separate_arguments)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Access

	header_break: detachable ET_BREAK
			-- Break which appears where the header comment is expected
		do
			if attached is_keyword as l_is_keyword then
				Result := l_is_keyword.break
			elseif attached arguments as l_arguments then
				Result := l_arguments.break
			elseif attached implementation_feature.synonym as l_synonym then
				Result := l_synonym.header_break
			else
				Result := extended_name.break
			end
		end

invariant

	procedure: type = Void
	is_procedure: is_procedure

end
