note

	description:

	"[
		Groups containing the text of a class which is currently open in an editor
		but not saved yet in its associated file.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_EDITED_CLASS_TEXT_GROUP

inherit

	ET_PRIMARY_GROUP

	ET_IMPORTED_AGENT_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_text: like class_text; a_class: like current_class)
			-- Create a new edited class text.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string_8: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
			a_class_not_void: a_class /= Void
		do
			set_class_text (a_text)
			set_current_class (a_class)
		ensure
			class_text_set: class_text = a_text
			current_class_set: current_class = a_class
		end

feature -- Status report

	is_override: BOOLEAN
			-- <Precursor>
		do
			Result:= current_group.is_override
		end

	is_read_only: BOOLEAN
			-- <Precursor>
		do
			Result:= current_group.is_read_only
		end

	is_preparsed: BOOLEAN = True
			-- <Precursor>

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is current group the primary group of `a_class'?
			-- Do not take into account overridden classes.
		do
			Result := a_class.is_in_group (Current) and then not a_class.is_overridden
		end

feature -- Access

	class_text: STRING_8
			-- Text of `current_class' 
			-- (using UTF-8 encoding)

	current_class: ET_CLASS
			-- Class whose text is being edited

	current_group: ET_PRIMARY_GROUP
			-- Group to which `current_class' belongs when it's
			-- not being edited

	name: STRING
			-- Name
		do
			Result := current_group.name
		end

	pathname: detachable STRING
			-- Directory pathname (may be Void)
		do
			Result := current_group.pathname
		end

	universe: ET_UNIVERSE
			-- Surrounding universe
		do
			Result := current_group.universe
		end

	time_stamp: INTEGER
			-- Version of the edited class text

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

	set_class_text (a_text: STRING_8)
			-- Set `class_text' to `a_text'.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string_8: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
		do
			class_text := a_text
			time_stamp := time_stamp + 1
		ensure
			class_text_set: class_text = a_text
		end

	set_current_class (a_class: like current_class)
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
			current_group := a_class.group
			use_obsolete_syntax := current_group.use_obsolete_syntax
		ensure
			current_class_set: current_class = a_class
			current_group_set: current_group = a_class.group
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

	class_text_not_void: class_text /= Void
	class_text_is_string_8: class_text.same_type ({STRING_8} "")
	valid_utf8_class_text: {UC_UTF8_ROUTINES}.valid_utf8 (class_text)
	current_class_not_void: current_class /= Void
	current_group_not_void: current_group /= Void

end
