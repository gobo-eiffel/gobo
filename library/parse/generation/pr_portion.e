indexing

	description:

		"Portion of tables associated with states or %
		%nonterminal symbols and used during the table %
		%generation of parser engines"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_PORTION

inherit

	COMPARABLE

creation

	make_state, make_symbol

feature {NONE} -- Initialization

	make_state (state_id: INTEGER; f: like froms; t: like tos) is
			-- Create a new portion of table associated
			-- with the state `state_id'.
		require
			f_not_void: f /= Void
			t_not_void: t /= Void
			same_count: f.count = t.count
			count_positive: f.count > 0
			f_sorted: f.sorted (Integer_sorter)
		do
			id := state_id
			froms := f
			tos := t
			count := froms.count
			width := froms.last - froms.first + 1
			is_state := True
		ensure
			id_set: id = state_id
			froms_set: froms = f
			tos_set: tos = t
			is_state: is_state
		end

	make_symbol (symbol_id: INTEGER; f: like froms; t: like tos) is
			-- Create a new portion of table associated
			-- with the nonterminal symbol `symbol_id'.
		require
			f_not_void: f /= Void
			t_not_void: t /= Void
			same_count: f.count = t.count
			count_positive: f.count > 0
			f_sorted: f.sorted (Integer_sorter)
		do
			id := symbol_id
			froms := f
			tos := t
			count := froms.count
			width := froms.last - froms.first + 1
		ensure
			id_set: id = symbol_id
			froms_set: froms = f
			tos_set: tos = t
			is_symbol: not is_state
		end

feature -- Status report

	is_state: BOOLEAN
			-- Is current table portion associated with
			-- a state? (Otherwise it is associated
			-- with a nonterminal symbol.)

feature -- Access

	id: INTEGER
			-- Id of the state or the symbol associated
			-- with current table portion

	froms, tos: DS_ARRAYED_LIST [INTEGER]
			-- If current table portion is associated with
			-- a symbol, then `froms' and `tos' are the state
			-- ids of the source and target of transitions
			-- other than those leading to the default state
			-- for that particular symbol;
			-- If it is associated with a state, then `froms'
			-- are token ids which causes reduction of the
			-- the rules (whose ids are stored in `tos') other
			-- that the default rule for that particular state

	count: INTEGER
			-- Number of items in `froms' and `tos'

	width: INTEGER
			-- Distance between the smallest and
			-- largest values in `froms'

	position: INTEGER
			-- Position of current portion in the table

feature -- Setting

	set_position (p: INTEGER) is
			-- Set `position' to `p'.
		do
			position := p
		ensure
			position_set: position = p
		end

feature -- Comparison

	same_portion (other: like Current): BOOLEAN is
			-- Are current portion and `other' considered
			-- the same? (Do not redefine `is_equal' here
			-- because it is incompatible with the semantic
			-- inherited from COMPARABLE.)
		require
			other_not_void: other /= Void
		local
			other_froms: like froms
			other_tos: like tos
			i: INTEGER
		do
			if
				is_state = other.is_state and
				width = other.width and
				count = other.count
			then
				Result := True
				other_froms := other.froms
				other_tos := other.tos
				from i := count until i < 1 loop
					if
						tos.item (i) /= other_tos.item (i) or
						froms.item (i) /= other_froms.item (i)
					then
						Result := False
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		ensure
			same_category: Result implies (is_state = other.is_state)
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is current table portion considered
			-- less than `other'?
		do
			if width = other.width then
				if count = other.count then
						-- Keep portions sorted by
						-- category, symbols first.
					Result := not is_state and other.is_state
				else
					Result := count < other.count
				end
			else
				Result := width < other.width
			end
		end

	order_is_equal (other: like Current): BOOLEAN is
			-- Are current portion and `other' considered
			-- equal according to the order relationship?
		do
			Result := is_state = other.is_state and
				width = other.width and count = other.count
		ensure
			definition: Result = not (Current < other or other < Current)
		end

feature -- Constants

	Integer_sorter: DS_BUBBLE_SORTER [INTEGER] is
			-- Integer sorter
		once
			!! Result
		ensure
			integer_sorter_not_void: Result /= Void
		end

invariant

	froms_not_void: froms /= Void
	froms_count: froms.count = count
	froms_sorted: froms.sorted (Integer_sorter)
	tos_not_void: tos /= Void
	tos_count: tos.count = count
	count_positive: count > 0
	width_definition: width = (froms.last - froms.first + 1)

end -- class PR_PORTION
