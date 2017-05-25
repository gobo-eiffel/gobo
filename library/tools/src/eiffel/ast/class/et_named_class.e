note

	description:

		"Eiffel classes with a given name."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/09/15 $"
	revision: "$Revision: #3 $"

deferred class ET_NAMED_CLASS

inherit

	HASHABLE

feature -- Access

	name: ET_CLASS_NAME
			-- Name of class

	upper_name: STRING
			-- Upper-name of class
			-- (May return the same object as `name.name' if already in upper case,
			-- otherwise return a new object at each call.)
		do
			Result := name.upper_name
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			definition: Result.is_equal (name.name.as_upper)
		end

	lower_name: STRING
			-- Lower-name of class
			-- (May return the same object as `name.name' if already in lower case,
			-- otherwise return a new object at each call.)
		do
			Result := name.lower_name
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			definition: Result.is_equal (name.name.as_lower)
		end

	actual_class: ET_CLASS
			-- Actual class
		deferred
		ensure
			actual_class_not_void: Result /= Void
		end

	unignorable_actual_class: ET_CLASS
			-- Actual class, not taking into account the
			-- ignored status of classes
		do
			Result := actual_class
		ensure
			unignorable_actual_class_not_void: Result /= Void
		end

	first_non_override_overridden_class: detachable ET_CLASS
			-- First class other than `actual_class' that is not in an override group;
			-- Void if no such class
		deferred
		end

	actual_intrinsic_class: ET_CLASS
			-- Actual class, not taking into account (recursively) the
			-- fact that a class may be overridden by classes declared
			-- in override groups of other universes
		do
			Result := actual_class
		ensure
			actual_intrinsic_class_not_void: Result /= Void
		end

	intrinsic_class: ET_NAMED_CLASS
			-- Class declared either locally in `universe' or imported from another universe,
			-- that will represent the current class in `universe' when not taking into account
			-- the fact that the current class may be overridden by classes declared in override
			-- groups of other universes
		do
			Result := Current
		ensure
			intrinsic_class_not_void: Result /= Void
		end

	universe: ET_UNIVERSE
			-- Universe to which current class belongs
		deferred
		ensure
			universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
		do
			Result := universe.current_system
		ensure
			current_system_not_void: Result /= Void
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := name.hash_code
		end

feature -- Status report

	is_override (a_universe: ET_UNIVERSE): BOOLEAN
			-- Is current class considered as an override class in `a_universe'?
			-- This means that current class has been declared in an override
			-- group and that group is part of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		deferred
		ensure
			in_universe: Result implies universe = a_universe
		end

	same_named_class (other: ET_NAMED_CLASS): BOOLEAN
			-- Do `Current' and `other' represent the same class?
		require
			other_not_void: other /= Void
		do
			if not actual_class.is_unknown then
				Result := actual_class = other.actual_class
			end
		end

feature -- Preparsing status

	is_preparsed: BOOLEAN
			-- Has current class been preparsed (i.e. its group is already
			-- known but the class has not necessarily been parsed yet)?
		deferred
		end

feature -- Parsing status

	is_parsed: BOOLEAN
			-- Has current class been parsed?
		deferred
		end

	is_parsed_successfully: BOOLEAN
			-- Has current class been successfully parsed?
		deferred
		ensure
			definition: Result = (is_parsed and then not has_syntax_error)
		end

	has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?
		deferred
		end

feature -- Ancestor building status

	ancestors_built: BOOLEAN
			-- Have `ancestors' been built?
		deferred
		end

	ancestors_built_successfully: BOOLEAN
			-- Have `ancestors' been successfully built?
		do
			Result := ancestors_built and then not has_ancestors_error
		ensure
			definition: Result = (ancestors_built and then not has_ancestors_error)
		end

	has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred when building `ancestors'?
		deferred
		end

feature -- Feature flattening status

	features_flattened: BOOLEAN
			-- Have features been flattened?
		deferred
		end

	features_flattened_successfully: BOOLEAN
			-- Have features been successfully flattened?
		do
			Result := features_flattened and then not has_flattening_error
		ensure
			definition: Result = (features_flattened and then not has_flattening_error)
		end

	has_flattening_error: BOOLEAN
			-- Has a fatal error occurred during feature flattening?
		deferred
		end

feature -- Interface checking status

	interface_checked: BOOLEAN
			-- Has the interface of current class been checked?
		deferred
		end

	interface_checked_successfully: BOOLEAN
			-- Has the interface of current class been successfully checked?
		do
			Result := interface_checked and then not has_interface_error
		ensure
			definition: Result = (interface_checked and then not has_interface_error)
		end

	has_interface_error: BOOLEAN
			-- Has a fatal error occurred during interface checking?
		deferred
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN
			-- Has the implementation of current class been checked?
			-- Immediate and redefined (and possibly inherited when in flat mode)
			-- features and invariant have been checked.
		deferred
		end

	not_implementation_checked: BOOLEAN
			-- Has the implementation of current class not been checked?
			-- Immediate and redefined (and possibly inherited when in flat mode)
			-- features and invariant have not been checked.
		do
			Result := not implementation_checked
		ensure
			definition: Result = not implementation_checked
		end

	implementation_checked_successfully: BOOLEAN
			-- Has the implementation of current class been successfully checked?
		deferred
		ensure
			definition: Result = (implementation_checked and then not has_implementation_error)
		end

	has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?
		deferred
		end

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			same_class_name: name.same_class_name (a_name)
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- System

	is_marked: BOOLEAN
			-- Has current class been marked?
			--
			-- For example it can be marked as being reachable from the root class.

	set_marked (b: BOOLEAN)
			-- Set `is_marked' to `b'.
		do
			is_marked := b
		ensure
			marked_set: is_marked = b
		end

	in_system: BOOLEAN
			-- Is current class reachable from the root class?
		do
			Result := is_marked
		end

	set_in_system (b: BOOLEAN)
			-- Set `in_system' to `b'.
		do
			set_marked (b)
		ensure
			in_system_set: in_system = b
		end

invariant

	name_not_void: name /= Void
--	no_cycle: no cycle in graph of named classes
	syntax_error: has_syntax_error implies is_parsed
	ancestors_error: has_ancestors_error implies ancestors_built
	flattening_error: has_flattening_error implies features_flattened
	interface_error: has_interface_error implies interface_checked
	implementation_error: has_implementation_error implies implementation_checked

end
