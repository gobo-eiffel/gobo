indexing

	description:

		"Eiffel standalone closures, e.g. features or invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_STANDALONE_CLOSURE

inherit

	ET_CLOSURE

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

feature -- Access

	first_precursor: ET_STANDALONE_CLOSURE is
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

	implementation_feature: ET_STANDALONE_CLOSURE is
			-- Current feature in `implementation_class',
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		end

feature -- Export status

	clients: ET_CLIENT_LIST is
			-- Clients to which feature is exported
		deferred
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN
			-- Has the implementation of current feature been checked?
			-- (Check everything except assertions.)

	has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?
			-- (Check everything except assertions.)

	assertions_checked: BOOLEAN
			-- Has the implementation of assertions of current feature been checked?

	has_assertions_error: BOOLEAN
			-- Has a fatal error occurred during assertions implementation checking?

	set_implementation_checked is
			-- Set `implementation_checked' to True.
		do
			implementation_checked := True
		ensure
			implementation_checked: implementation_checked
		end

	set_implementation_error is
			-- Set `has_implementation_error' to True.
		do
			has_implementation_error := True
		ensure
			has_implementation_error: has_implementation_error
		end

	reset_implementation_checked is
			-- Set `implementation_checked' to False.
		do
			has_implementation_error := False
			implementation_checked := False
		ensure
			implementation_not_checked: not implementation_checked
			no_implementation_error: not has_implementation_error
		end

	set_assertions_checked is
			-- Set `assertions_checked' to True.
		do
			assertions_checked := True
		ensure
			assertions_checked: assertions_checked
		end

	set_assertions_error is
			-- Set `has_assertions_error' to True.
		do
			has_assertions_error := True
		ensure
			has_assertions_error: has_assertions_error
		end

	reset_assertions_checked is
			-- Set `assertions_checked' to False.
		do
			has_assertions_error := False
			assertions_checked := False
		ensure
			assertions_not_checked: not assertions_checked
			no_assertions_error: not has_assertions_error
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

end
