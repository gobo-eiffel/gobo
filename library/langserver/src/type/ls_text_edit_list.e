note

	description:

		"LSP lists of text edits"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_EDIT_LIST

inherit

	LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of text edits.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of text edits with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create text_edits.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := text_edits.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = text_edits.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := text_edits.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = text_edits.capacity
		end

feature -- Access

	text_edit (i: INTEGER): LS_TEXT_EDIT
			-- Text edit at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := text_edits.item (i)
		ensure
			text_edit_not_void: Result /= Void
			definition: Result = text_edits.item (i)
		end

	text_edits: DS_ARRAYED_LIST [LS_TEXT_EDIT]
			-- Text edits

feature -- Element change

	put_last (a_text_edit: LS_TEXT_EDIT)
			-- Put `a_text_edit` at the end of the list of text edits.
		require
			a_text_edit_not_void: a_text_edit /= Void
		do
			text_edits.force_last (a_text_edit)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_edit_list (Current)
		end

invariant

	text_edits_not_void: text_edits /= Void
	no_void_text_edit: not text_edits.has_void

end
