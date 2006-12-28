indexing

	description:

		"Eiffel features or invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ENCLOSING_FEATURE

inherit

	ANY

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

	first_precursor: ET_ENCLOSING_FEATURE is
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

	implementation_feature: ET_ENCLOSING_FEATURE is
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

end
