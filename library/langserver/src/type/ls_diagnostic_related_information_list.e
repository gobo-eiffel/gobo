note

	description:

		"LSP lists of diagnostic related informations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_RELATED_INFORMATION_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of diagnostic related informations.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of diagnostic related informations with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create diagnostic_related_informations.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := diagnostic_related_informations.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = diagnostic_related_informations.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := diagnostic_related_informations.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = diagnostic_related_informations.capacity
		end

feature -- Access

	diagnostic_related_information (i: INTEGER): LS_DIAGNOSTIC_RELATED_INFORMATION
			-- Diagnostic related information at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := diagnostic_related_informations.item (i)
		ensure
			diagnostic_related_information_not_void: Result /= Void
			definition: Result = diagnostic_related_informations.item (i)
		end

	diagnostic_related_informations: DS_ARRAYED_LIST [LS_DIAGNOSTIC_RELATED_INFORMATION]
			-- Diagnostic related information

feature -- Element change

	put_last (a_diagnostic_related_information: LS_DIAGNOSTIC_RELATED_INFORMATION)
			-- Put `a_diagnostic_related_information` at the end of the list of diagnostic related informations.
		require
			a_diagnostic_related_information_not_void: a_diagnostic_related_information /= Void
		do
			diagnostic_related_informations.force_last (a_diagnostic_related_information)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_related_information_list (Current)
		end

invariant

	diagnostic_related_informations_not_void: diagnostic_related_informations /= Void
	no_void_diagnostic_related_information: not diagnostic_related_informations.has_void

end
