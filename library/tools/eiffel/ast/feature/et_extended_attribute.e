indexing

	description:

		"Eiffel variable attributes with extended syntax"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTENDED_ATTRIBUTE

inherit

	ET_ATTRIBUTE
		undefine
			obsolete_message,
			preconditions,
			reset_preconditions,
			postconditions,
			reset_postconditions
		redefine
			make,
			header_break,
			last_leaf,
			break,
			new_synonym,
			renamed_feature,
			process
		end

	ET_EXTENDED_ATTRIBUTE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			arguments, type,
			implementation_feature
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_class: like implementation_class) is
			-- Create a new attribute.
		do
			precursor (a_name, a_type, a_class)
			attribute_keyword := tokens.attribute_keyword
			end_keyword := tokens.end_keyword
		end

feature -- Access

	obsolete_message: ET_OBSOLETE
			-- Obsolete message

	header_break: ET_BREAK is
			-- Break which appears where the header comment is expected
		local
			l_break: ET_BREAK
		do
			l_break := declared_type.break
			if l_break /= Void and then l_break.has_comment then
				Result := l_break
			end
			if Result = Void and assigner /= Void then
				l_break := assigner.break
				if l_break /= Void and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				Result := declared_type.break
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if semicolon /= Void then
				Result := semicolon
			else
				Result := end_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if semicolon /= Void then
				Result := semicolon.break
			else
				Result := end_keyword.break
			end
		end

feature -- Setting

	set_obsolete_message (a_message: like obsolete_message) is
			-- Set `obsolete_message' to `a_message'.
		do
			obsolete_message := a_message
		ensure
			obsolete_message_set: obsolete_message = a_message
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_clients (clients)
			Result.set_attribute_keyword (attribute_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_attribute_keyword (attribute_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
--			a_processor.process_extended_attribute (Current)
		end

end
