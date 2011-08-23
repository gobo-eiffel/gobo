note

	description:

		"Eiffel standalone closures, e.g. features or invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_STANDALONE_CLOSURE

inherit

	ET_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		redefine
			implementation_feature
		end

	HASHABLE

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	is_feature: BOOLEAN
			-- Is `Current' a feature?
		do
			-- Result := False
		end

	is_invariants: BOOLEAN
			-- Is `Current' class invariants?
		do
			-- Result := False
		end

feature -- Access

	first_precursor: ET_STANDALONE_CLOSURE
			-- First precursor;
			-- Void if the feature has no precursor.
			-- Useful to build the flat preconditions and
			-- postconditions of the feature.
		deferred
		end

	implementation_class: ET_CLASS
			-- Class where implementation of current feature
			-- has been provided;
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		ensure
			implementation_class_not_void: Result /= Void
		end

	implementation_feature: ET_STANDALONE_CLOSURE
			-- Current feature in `implementation_class',
			-- Useful for interpreting feature calls and type
			-- anchors (that might be renamed in descendant classes)
			-- when feature is inherited as-is.
			-- Note that the signature has already been resolved
			-- in the context of the current class.
		deferred
		end

feature -- Export status

	clients: ET_CLIENT_LIST
			-- Clients to which feature is exported
		deferred
		ensure
			clients_not_void: Result /= Void
		end

feature -- Validity checking status

	validity_checked: BOOLEAN
			-- Has the validity of current closure been checked?
			-- (Check everything except preconditions and postconditions.)

	has_validity_error: BOOLEAN
			-- Has a fatal error occurred during validity checking?
			-- (Check everything except preconditions and postconditions.)

	set_validity_checked
			-- Set `validity_checked' to True.
		do
			validity_checked := True
		ensure
			validity_checked: validity_checked
		end

	set_validity_error
			-- Set `has_validity_error' to True.
		do
			has_validity_error := True
		ensure
			has_validity_error: has_validity_error
		end

	reset_validity_checked
			-- Set `validity_checked' to False.
		do
			has_validity_error := False
			validity_checked := False
		ensure
			validity_not_checked: not validity_checked
			no_validity_error: not has_validity_error
		end

feature -- Conversion

	as_feature: ET_FEATURE
			-- `Current' viewed as a feature
		require
			is_feature: is_feature
		do
			check is_feature: is_feature end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_invariants: ET_INVARIANTS
			-- `Current' viewed as class invariants
		require
			is_invariants: is_invariants
		do
			check is_invariants: is_invariants end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

end
