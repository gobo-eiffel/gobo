note

	description:

		"Eiffel class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"

class ET_LIBRARY

inherit

	ET_PRIMARY_GROUP
		rename
			group as library,
			has_class as group_has_class,
			has_class_recursive as has_class,
			class_count as group_class_count,
			class_count_recursive as class_count,
			classes_do_all as group_classes_do_all,
			classes_do_if as group_classes_do_if,
			classes_do_recursive as classes_do_all,
			classes_do_if_recursive as classes_do_if
		undefine
			current_system,
			hash_code,
			library,
			lower_name,
			full_name,
			full_lower_name,
			relative_name,
			relative_lower_name,
			class_count,
			classes_do_all,
			classes_do_if,
			kind_capitalized_name
		redefine
			is_library,
			kind_name,
			kind_name_plural,
			has_class
		end

	ET_INTERNAL_UNIVERSE
		rename
			universe as library,
			has_class as has_class_by_name
		redefine
			library,
			kind_name,
			preparse
		end

	ET_ADAPTED_LIBRARY
		rename
			make as make_adapted
		redefine
			library
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_system: ET_SYSTEM)
			-- Create a new Eiffel class library.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_system_not_void: a_system /= Void
		do
			make_from_system (a_name, a_system)
		ensure
			name_set: name = a_name
			current_system_set: current_system = a_system
		end

feature -- Status report

	is_library: BOOLEAN = True
			-- Is current group a library?

	is_override: BOOLEAN = False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	group_has_class (a_class: ET_CLASS): BOOLEAN
			-- Is current group the primary group of `a_class' ?
			-- Do not take into account overridden classes.
		do
			Result := False
		end

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Has `a_class' been declared locally in current library?
			-- Do not take into account overridden classes.
		do
			Result := a_class.universe = Current and then not a_class.is_overridden
		end

feature -- Access

	pathname: detachable STRING
			-- Library pathname (may be Void)
		do
		end

	library: ET_LIBRARY
			-- Eiffel library being adapted

	universe: ET_UNIVERSE
			-- Surrounding universe
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	kind_name: STRING
			-- Name of the kind of group or universe (e.g. "cluster", "assembly", "library", etc.)
		once
			Result := "library"
		end

	kind_name_plural: STRING
			-- Plural form of name of the kind of group (e.g. "clusters", "assemblies", "libraries", etc.)
		once
			Result := "libraries"
		end

feature -- Measurement

	group_class_count: INTEGER
			-- Number of classes with current group as primary group
		do
			Result := 0
		end

feature -- Nested

	parent: detachable ET_LIBRARY
			-- Parent group
		do
			-- Result := Void
		end

feature -- Iteration

	group_classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes with current group as primary group.
		do
		end

	group_classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes with current group as primary group
			-- that satisfy `a_test'.
		do
		end

feature -- Relations

	add_library_recursive (a_visited: DS_HASH_SET [ET_LIBRARY])
			-- Add current library to `a_visited' and
			-- recursively the libraries it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				libraries.do_all (agent {ET_LIBRARY}.add_library_recursive (a_visited))
			end
		end

feature -- Parsing

	preparse (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- <Precursor>
		do
			a_system_processor.error_handler.report_preparsing_status (Current)
			Precursor (a_system_processor)
		end

invariant

	self_adapted: library = Current

end
