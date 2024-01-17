note

	description:

	"[
		Groups containing of the text of their Eiffel classes
		(instead of having them stored in files like for clusters).
		Useful when dealing with classes whose class text has been extracted 
		from a SCM repository history rather than read from a file.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2015-2016, Eric Bezault and others"
	license: "MIT License"

class ET_TEXT_GROUP

inherit

	ET_PRIMARY_GROUP

	ET_IMPORTED_AGENT_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_universe: ET_UNIVERSE)
			-- Create a new text group.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			universe := a_universe
			create class_texts.make_map_default
		ensure
			name_set: name = a_name
			universe_set: universe = a_universe
		end

feature -- Status report

	is_override: BOOLEAN = False
			-- <Precursor>

	is_read_only: BOOLEAN = False
			-- <Precursor>

	is_preparsed: BOOLEAN = True
			-- <Precursor>

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is current cluster the primary group of `a_class'?
			-- Do not take into account overridden classes.
		do
			Result := a_class.is_in_group (Current) and then not a_class.is_overridden
		end

feature -- Access

	name: STRING
			-- Name

	pathname: detachable STRING
			-- Directory pathname (may be Void)

	universe: ET_UNIVERSE
			-- Surrounding universe

	class_text (a_class: ET_CLASS): detachable STRING
			-- Class text of `a_class', if recorded in current group
		require
			a_class_not_void: a_class /= Void
		do
			class_texts.search (a_class)
			if class_texts.found then
				Result := class_texts.found_item
			end
		end

	class_texts: DS_HASH_TABLE [detachable STRING, ET_CLASS]
			-- Class text recorded in current group, indexed by class

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_all (agent class_actions.call (?, agent l_counter.increment))
			Result := l_counter.item
		end

feature -- Nested

	parent: detachable ET_GROUP
			-- Parent group
		do
			-- Result := Void
		end

feature -- Setting

	set_class_text (a_text: detachable STRING; a_class: ET_CLASS)
			-- Set `a_text' to `class_text' associated with `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			class_texts.force_last (a_text, a_class)
		ensure
			class_text_set: class_text (a_class) = a_text
		end

	set_pathname (a_pathname: like pathname)
			-- Set `pathname' to `a_pathname'.
		do
			pathname := a_pathname
		ensure
			pathname_set: pathname = a_pathname
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes with current group as primary group.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent {ET_CLASS}.is_in_group (Current))
		end

	classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes with current group as primary group,
			-- and which satisfy `a_test'.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent class_actions.conjuncted_semistrict (?, agent {ET_CLASS}.is_in_group (Current), a_test))
		end

invariant

	class_texts_not_void: class_texts /= Void
	no_void_class: not class_texts.has_void

end
