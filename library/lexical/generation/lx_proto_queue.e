indexing

	description:

		"Queues of most recently used protos, which are DFA states %
		%with transition tables that have a high probability of %
		%either being redundant (a state processed later will have %
		%an identical transition table) or nearly redundant (a state %
		%processed later will have many of the same out-transitions), %
		%with the hope that most states will find a proto which is %
		%similar enough to be usable, and therefore compacting the %
		%output tables"


	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_PROTO_QUEUE

inherit

	DS_BILINKED_LIST [LX_PROTO]
		rename
			put as list_put
		export
	 		{NONE}
				list_put, put_first, put_last, put_left, put_right,
				force, force_first, force_last, force_left, force_right,
				extend, extend_first, extend_last, extend_left, extend_right,
				append, append_first, append_last, append_left, append_right
		end

creation

	make

feature -- Element change

	put (state_id: INTEGER;
		transitions: LX_TRANSITION_TABLE [LX_DFA_STATE];
		common_state: LX_DFA_STATE) is
			-- Create a new proto and insert it in the proto queue.
			-- Remove less recently used proto if queue is full.
		require
			transitions_not_void: transitions /= Void
			common_state_not_void: common_state /= Void
		local
			proto: LX_PROTO
		do
			!! proto.make (state_id, transitions, common_state)
			if count >= capacity then
				remove_last
			end
			put_first (proto)
		end

	move_to_front (a_cursor: like new_cursor) is
			-- Move proto at `a_cursor' position to front of queue.
		require
			not_empty: not is_empty
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_off: not a_cursor.off
		local
			proto: LX_PROTO
		do
			proto := a_cursor.item
			remove_at (a_cursor)
			put_first (proto)
		ensure
			moved: first = old (a_cursor.item)
		end

feature {NONE} -- Implementation

	capacity: INTEGER is 50
			-- Maximum number of protos in queue

invariant

	no_void_proto: not has (Void)

end -- class LX_PROTO_QUEUE
