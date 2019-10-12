note

	description:

		"Eiffel external-procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTERNAL_PROCEDURE

inherit

	ET_PROCEDURE
		rename
			make as make_procedure
		undefine
			is_external,
			is_static
		end

	ET_EXTERNAL_ROUTINE

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments;
		a_language: like language; a_class: like implementation_class)
			-- Create a new external procedure.
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			arguments := args
			language := a_language
			end_keyword := tokens.end_keyword
			clients := tokens.empty_clients
			implementation_class := a_class
			implementation_feature := Current
			builtin_class_code := tokens.builtin_not_builtin
			builtin_feature_code := tokens.builtin_not_builtin
		ensure
			extended_name_set: extended_name = a_name
			arguments_set: arguments = args
			language_set: language = a_language
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, arguments, language, implementation_class)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_alias_clause (alias_clause)
			Result.set_clients (clients)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_synonym (Current)
			if is_builtin then
					-- Reset the built-in marker because they are
					-- two different features with different names,
					-- and hence are not the same built-in feature.
				Result.set_builtin_code (tokens.builtin_unknown, tokens.builtin_unknown)
			end
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, language, implementation_class)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_alias_clause (alias_clause)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
			Result.set_builtin_code (builtin_class_code, builtin_feature_code)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_external_procedure (Current)
		end

end
