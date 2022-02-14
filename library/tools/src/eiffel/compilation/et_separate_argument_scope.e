note

	description:

	"[
		Eiffel separate argument (in separate instructions) scopes, 
		to determine whether a given occurrence of a separate argument
		appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEPARATE_ARGUMENT_SCOPE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new separate argument scope.
		do
			hidden_count := 0
			create separate_arguments.make (50)
		ensure
			count_set: count = 0
			hidden_count_set: hidden_count = 0
		end

feature -- Status report

	has_separate_argument (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of separate argument `a_name'?
			-- (Ignore hidden separate arguments.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			i := separate_arguments.count
			nb := hidden_count + 1
			from until i < nb loop
				if separate_arguments.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

	has_hidden_separate_argument (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of separate argument `a_name', although it has been hidden?
			-- (We are probably currently analyzing an inline agent and `a_name' has
			-- been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := hidden_count
			from until i < 1 loop
				if separate_arguments.item (i).name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	separate_argument (a_name: ET_IDENTIFIER): detachable ET_SEPARATE_ARGUMENT
			-- If we are currently in the scope of separate argument `a_name',
			-- then return this separate argument, otherwise Void
			-- (Ignore hidden separate arguments.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_separate_argument: ET_SEPARATE_ARGUMENT
		do
			i := separate_arguments.count
			nb := hidden_count + 1
			from until i < nb loop
				l_separate_argument := separate_arguments.item (i)
				if l_separate_argument.name.same_identifier (a_name) then
					Result := l_separate_argument
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			separate_argument_not_void: has_separate_argument (a_name) = (Result /= Void)
		end

	hidden_separate_argument (a_name: ET_IDENTIFIER): detachable ET_SEPARATE_ARGUMENT
			-- If we are currently in the scope of separate argument `a_name' although it has
			-- been hidden, then return this separate argument, otherwise Void
			-- (We are probably currently analyzing an inline agent and `a_name'
			-- has been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_separate_argument: ET_SEPARATE_ARGUMENT
		do
			i := hidden_count
			from until i < 1 loop
				l_separate_argument := separate_arguments.item (i)
				if l_separate_argument.name.same_identifier (a_name) then
					Result := l_separate_argument
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			separate_argument_not_void: has_hidden_separate_argument (a_name) = (Result /= Void)
		end

	separate_arguments: DS_ARRAYED_LIST [ET_SEPARATE_ARGUMENT]
			-- Separate arguments for which we are currently within scope their separate argument
			-- (Hidden separate arguments are stored between indexes 1 and `hidden_count'.)

feature -- Measurement

	count: INTEGER
			-- Number of separate arguments for which we are currently within their scope
			-- (Hidden separate arguments are counted.)
		do
			Result := separate_arguments.count
		ensure
			count_not_negative: Result >= 0
		end

	hidden_count: INTEGER
			-- Number of separate arguments for which we consider that
			-- we are not currently within their scope. 
			-- Useful when analyzing inline agents: we should not use 
			-- separate arguments declared in the enclosing feature or 
			-- inline agent.

feature -- Element change

	add_separate_argument (a_separate_argument: ET_SEPARATE_ARGUMENT)
			-- Indicate that we are currently within the scope
			-- of the separate argument of `a_separate_argument'.
		require
			a_separate_argument_not_void: a_separate_argument /= Void
		do
			separate_arguments.force_last (a_separate_argument)
		ensure
			one_more: count = old count + 1
		end

	remove_separate_arguments (n: INTEGER)
			-- Indicate that we are not in the scope of
			-- the last `n' separate arguments.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n <= count - hidden_count
		do
			separate_arguments.prune_last (n)
		ensure
			removed: count = old count - n
		end

	keep_separate_arguments (n: INTEGER)
			-- Indicate that we are now in the scope of
			-- only the first `n' separate arguments.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n >= hidden_count
		do
			separate_arguments.keep_first (n)
		ensure
			kept: count = n
		end

	hide_separate_arguments (n: INTEGER)
			-- Indicate that from now on we consider that we
			-- are not in the scope of the first `n' separate
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
			-- Indicate that we are in the scope of no separate argument anymore.
		do
			hidden_count := 0
			separate_arguments.wipe_out
		ensure
			wiped_out: count = 0
			no_hidden: hidden_count = 0
		end

invariant

	separate_arguments_not_void: separate_arguments /= Void
	no_void_separate_argument: not separate_arguments.has_void
	hidden_count_not_negative: hidden_count >= 0
	hidden_count_small_enough: hidden_count <= count

end
