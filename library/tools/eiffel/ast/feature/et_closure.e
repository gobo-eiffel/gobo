note

	description:

		"Eiffel closures, e.g. features, invariants, inline agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLOSURE

inherit

	ANY

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if no arguments
		do
		end

	locals: ET_LOCAL_VARIABLE_LIST is
			-- Local variables;
			-- Void if no local variables
		do
		end

	object_tests: ET_OBJECT_TEST_LIST
			-- Object-tests declared in current closure;
			-- Void if none

	implementation_closure: ET_CLOSURE is
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

	set_object_tests (a_object_tests: like object_tests) is
			-- Set `object_tests' to `a_object_tests'.
		do
			object_tests := a_object_tests
		ensure
			object_tests_set: object_tests = a_object_tests
		end

end
