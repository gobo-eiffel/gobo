note

	description:

		"Eiffel closures, e.g. features, invariants, inline agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLOSURE

inherit

	ANY

feature -- Access

	type: detachable ET_TYPE
			-- Return type;
			-- Void for procedures
		do
		end

	arguments: detachable ET_FORMAL_ARGUMENT_LIST
			-- Formal arguments;
			-- Void if no arguments
		do
		end

	first_indexing: detachable ET_INDEXING_LIST
			-- Note clause at the beginning of the closure
		do
		end

	locals: detachable ET_LOCAL_VARIABLE_LIST
			-- Local variables;
			-- Void if no local variables
		do
		end

	preconditions: detachable ET_PRECONDITIONS
			-- Preconditions;
			-- Void if no preconditions
		do
		end

	postconditions: detachable ET_POSTCONDITIONS
			-- Postconditions;
			-- Void if no postconditions
		do
		end

	object_tests: detachable ET_OBJECT_TEST_LIST
			-- Object-tests declared in current closure;
			-- Void if none

	across_components: detachable ET_ACROSS_COMPONENT_LIST
			-- Across components declared in current closure;
			-- Void if none

	implementation_closure: ET_CLOSURE
			-- Current closure viewed from the class where it has been implemented
			--
			-- Useful for interpreting feature calls and type anchors (that might
			-- be renamed in descendant classes) when features are inherited as-is.
		do
			Result := Current
		ensure
			implementation_closure_not_void: Result /= Void
		end

feature -- Setting

	set_object_tests (a_object_tests: like object_tests)
			-- Set `object_tests' to `a_object_tests'.
		do
			object_tests := a_object_tests
		ensure
			object_tests_set: object_tests = a_object_tests
		end

	set_across_components (a_across_components: like across_components)
			-- Set `across_components' to `a_across_components'.
		do
			across_components := a_across_components
		ensure
			across_components_set: across_components = a_across_components
		end

end
