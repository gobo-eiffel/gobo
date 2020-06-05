note

	description:

		"Eiffel variable attributes with extended syntax"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2011/09/15 $"
	revision: "$Revision: #5 $"

class ET_EXTENDED_ATTRIBUTE

inherit

	ET_ATTRIBUTE
		undefine
			locals,
			preconditions,
			reset_preconditions,
			postconditions,
			reset_postconditions
		redefine
			make,
			reset_after_interface_checked,
			obsolete_message,
			header_break,
			last_leaf,
			new_synonym,
			renamed_feature,
			process
		end

	ET_EXTENDED_ATTRIBUTE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			arguments,
			first_indexing,
			implementation_feature
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_class: like implementation_class)
			-- Create a new attribute.
		do
			end_keyword := tokens.end_keyword
			precursor (a_name, a_type, a_class)
		end

feature -- Initialization

	reset_after_interface_checked
			-- Reset current attribute as it was just after its interface was last checked.
		do
			if validity_checked then
				if attached locals as l_locals then
					l_locals.reset
				end
				if attached compound as l_compound then
					l_compound.reset
				end
				if attached rescue_clause as l_rescue_clause then
					l_rescue_clause.reset
				end
			end
			precursor
		end

feature -- Status report

	has_self_initializing_code: BOOLEAN
			-- Has current attribute code for self-initialization?
			-- If it has just pre- and postconditions, then we consider
			-- that it is not a declaration for self-initialization.
		do
			Result := locals /= Void or else rescue_clause /= Void or else
				attached compound as l_compound and then l_compound.has_non_null_instruction
		end

feature -- Access

	obsolete_message: detachable ET_OBSOLETE
			-- Obsolete message

	header_break: detachable ET_BREAK
			-- Break which appears where the header comment is expected
		do
			if attached declared_type.break as l_break and then l_break.has_comment then
				Result := l_break
			end
			if Result = Void and attached assigner as l_assigner then
				if attached l_assigner.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				Result := declared_type.break
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached semicolon as l_semicolon then
				Result := l_semicolon
			else
				Result := end_keyword
			end
		end

feature -- Setting

	set_obsolete_message (a_message: like obsolete_message)
			-- Set `obsolete_message' to `a_message'.
		do
			obsolete_message := a_message
		ensure
			obsolete_message_set: obsolete_message = a_message
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_locals (locals)
			Result.set_compound (compound)
			Result.set_postconditions (postconditions)
			Result.set_rescue_clause (rescue_clause)
			Result.set_clients (clients)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current
			-- Renamed version of current feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_locals (locals)
			Result.set_compound (compound)
			Result.set_postconditions (postconditions)
			Result.set_rescue_clause (rescue_clause)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
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
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_extended_attribute (Current)
		end

end
