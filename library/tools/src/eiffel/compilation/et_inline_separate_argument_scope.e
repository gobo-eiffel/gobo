note

	description:

	"[
		Eiffel inline separate argument (in inline separate instructions) scopes, 
		to determine whether a given occurrence of an inline separate argument
		appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"

class ET_INLINE_SEPARATE_ARGUMENT_SCOPE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new inline separate argument scope.
		do
			hidden_count := 0
			create inline_separate_arguments.make (50)
		ensure
			count_set: count = 0
			hidden_count_set: hidden_count = 0
		end

feature -- Status report

	has_inline_separate_argument (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of inline separate argument `a_name'?
			-- (Ignore hidden inline separate arguments.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			i := inline_separate_arguments.count
			nb := hidden_count + 1
			from until i < nb loop
				if inline_separate_arguments.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

	has_hidden_inline_separate_argument (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of inline separate argument
			-- `a_name', although it has been hidden?
			-- (We are probably currently analyzing an inline agent and `a_name' has
			-- been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := hidden_count
			from until i < 1 loop
				if inline_separate_arguments.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	inline_separate_argument (a_name: ET_IDENTIFIER): detachable ET_INLINE_SEPARATE_ARGUMENT
			-- If we are currently in the scope of inline separate argument `a_name',
			-- then return this inline separate argument, otherwise Void
			-- (Ignore hidden inline separate arguments.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT
		do
			i := inline_separate_arguments.count
			nb := hidden_count + 1
			from until i < nb loop
				l_inline_separate_argument := inline_separate_arguments.item (i)
				if l_inline_separate_argument.name.same_identifier (a_name) then
					Result := l_inline_separate_argument
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			inline_separate_argument_not_void: has_inline_separate_argument (a_name) = (Result /= Void)
		end

	hidden_inline_separate_argument (a_name: ET_IDENTIFIER): detachable ET_INLINE_SEPARATE_ARGUMENT
			-- If we are currently in the scope of inline separate argument
			-- `a_name' although it has been hidden, then return this inline
			-- separate argument, otherwise Void
			-- (We are probably currently analyzing an inline agent and `a_name'
			-- has been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT
		do
			i := hidden_count
			from until i < 1 loop
				l_inline_separate_argument := inline_separate_arguments.item (i)
				if l_inline_separate_argument.name.same_identifier (a_name) then
					Result := l_inline_separate_argument
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			inline_separate_argument_not_void: has_hidden_inline_separate_argument (a_name) = (Result /= Void)
		end

	inline_separate_arguments: DS_ARRAYED_LIST [ET_INLINE_SEPARATE_ARGUMENT]
			-- Inline separate arguments for which we are currently within scope their inline separate argument
			-- (Hidden inline separate arguments are stored between indexes 1 and `hidden_count'.)

feature -- Measurement

	count: INTEGER
			-- Number of inline separate arguments for which we are currently within their scope
			-- (Hidden inline separate arguments are counted.)
		do
			Result := inline_separate_arguments.count
		ensure
			count_not_negative: Result >= 0
		end

	hidden_count: INTEGER
			-- Number of inline separate arguments for which we consider that
			-- we are not currently within their scope.
			-- Useful when analyzing inline agents: we should not use
			-- separate arguments declared in the enclosing feature or
			-- inline agent.

feature -- Element change

	add_inline_separate_argument (a_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT)
			-- Indicate that we are currently within the scope
			-- of the inline separate argument of `a_inline_separate_argument'.
		require
			a_inline_separate_argument_not_void: a_inline_separate_argument /= Void
		do
			inline_separate_arguments.force_last (a_inline_separate_argument)
		ensure
			one_more: count = old count + 1
		end

	remove_inline_separate_arguments (n: INTEGER)
			-- Indicate that we are not in the scope of
			-- the last `n' inline separate arguments.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n <= count - hidden_count
		do
			inline_separate_arguments.prune_last (n)
		ensure
			removed: count = old count - n
		end

	keep_inline_separate_arguments (n: INTEGER)
			-- Indicate that we are now in the scope of
			-- only the first `n' inline separate arguments.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n >= hidden_count
		do
			inline_separate_arguments.keep_first (n)
		ensure
			kept: count = n
		end

	hide_inline_separate_arguments (n: INTEGER)
			-- Indicate that from now on we consider that we
			-- are not in the scope of the first `n' inline separate
			-- arguments. Useful when analyzing inline agents:
			-- we should not use separate arguments declared in
			-- the enclosing feature or inline agent.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
		do
			hidden_count := n
		ensure
			hidden: hidden_count = n
			same_count: count = old count
		end

	wipe_out
			-- Indicate that we are in the scope of no inline separate argument anymore.
		do
			hidden_count := 0
			inline_separate_arguments.wipe_out
		ensure
			wiped_out: count = 0
			no_hidden: hidden_count = 0
		end

invariant

	inline_separate_arguments_not_void: inline_separate_arguments /= Void
	no_void_inline_separate_argument: not inline_separate_arguments.has_void
	hidden_count_not_negative: hidden_count >= 0
	hidden_count_small_enough: hidden_count <= count

end
