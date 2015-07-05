note

	description:

		"Eiffel implicit type marks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IMPLICIT_TYPE_MARK

inherit

	ET_TYPE_MARK
		redefine
			is_attached_mark,
			is_detachable_mark,
			is_expanded_mark,
			is_reference_mark,
			is_separate_mark,
			is_implicit_mark
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new implicit type mark.
		do
		end

feature -- Access

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := tokens.null_position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := tokens.null_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := tokens.null_leaf
		end

feature -- Status report

	is_expanded_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be expanded?

	is_reference_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be reference?

	is_separate_mark: BOOLEAN
			-- Is current type mark a mark to indicate that
			-- the type should be separate?

	is_attached_mark: BOOLEAN
			-- Is current type mark an attached mark?

	is_detachable_mark: BOOLEAN
			-- Is current type mark a detachable mark?

	is_implicit_mark: BOOLEAN = True
			-- Is current type mark implicit?

feature -- Status setting

	set_expanded_mark (b: BOOLEAN)
			-- Set `is_expanded_mark' to `b'.
		do
			is_expanded_mark := b
			if b then
				is_reference_mark := False
			end
		ensure
			expanded_mark_set: is_expanded_mark = b
		end

	set_reference_mark (b: BOOLEAN)
			-- Set `is_reference_mark' to `b'.
		do
			is_reference_mark := b
			if b then
				is_expanded_mark := False
			end
		ensure
			reference_mark_set: is_reference_mark = b
		end

	set_separate_mark (b: BOOLEAN)
			-- Set `is_referenceseparate_mark' to `b'.
		do
			is_separate_mark := b
		ensure
			separate_mark_set: is_separate_mark = b
		end

	set_attached_mark (b: BOOLEAN)
			-- Set `is_attached_mark' to `b'.
		do
			is_attached_mark := b
			if b then
				is_detachable_mark := False
			end
		ensure
			attached_mark_set: is_attached_mark = b
		end

	set_detachable_mark (b: BOOLEAN)
			-- Set `is_detachable_mark' to `b'.
		do
			is_detachable_mark := b
			if b then
				is_attached_mark := False
			end
		ensure
			detachable_mark_set: is_detachable_mark = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_implicit_type_mark (Current)
		end

end
