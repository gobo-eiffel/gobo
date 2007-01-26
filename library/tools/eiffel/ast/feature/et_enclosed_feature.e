indexing

	description:

		"Eiffel features, invariants or inline agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ENCLOSED_FEATURE

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	is_feature: BOOLEAN is
			-- Is `Current' a feature?
		do
			-- Result := False
		end

	is_invariants: BOOLEAN is
			-- Is `Current' class invariants?
		do
			-- Result := False
		end

	is_inline_agent: BOOLEAN is
			-- Is `Current' an inline agent?
		do
			-- Result := False
		end

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		deferred
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		deferred
		end

	locals: ET_LOCAL_VARIABLE_LIST is
			-- Local variables;
			-- Void if not an internal routine or a routine with no local variables
		deferred
		end

	first_precursor: ET_ENCLOSED_FEATURE is
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.
		deferred
		end

	implementation_class: ET_CLASS is
			-- Class where implementation of current feature
			-- has been provided;
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		end

	implementation_feature: ET_ENCLOSED_FEATURE is
			-- Current feature in `implementation_class',
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		end

feature -- Export status

	clients: ET_CLASS_NAME_LIST is
			-- Clients to which feature is exported
		deferred
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN is
			-- Has the implementation of current feature been checked?
			-- (Check everything except assertions.)
		deferred
		end

	has_implementation_error: BOOLEAN is
			-- Has a fatal error occurred during implementation checking?
			-- (Check everything except assertions.)
		deferred
		end

	assertions_checked: BOOLEAN is
			-- Has the implementation of assertions of current feature been checked?
		deferred
		end

	has_assertions_error: BOOLEAN is
			-- Has a fatal error occurred during assertions implementation checking?
		deferred
		end

feature -- Conversion

	as_feature: ET_FEATURE is
			-- `Current' viewed as a feature
		require
			is_feature: is_feature
		do
			check is_feature: is_feature end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_invariants: ET_INVARIANTS is
			-- `Current' viewed as class invariants
		require
			is_invariants: is_invariants
		do
			check is_invariants: is_invariants end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_inline_agent: ET_INLINE_AGENT is
			-- `Current' viewed as an inline agent
		require
			is_inline_agent: is_inline_agent
		do
			check is_inline_agent: is_inline_agent end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

end
