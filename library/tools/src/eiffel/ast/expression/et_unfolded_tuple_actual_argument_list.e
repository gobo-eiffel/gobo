note

	description:

	"[
		Eiffel actual arguments of a Tuple-argument-unfolded form of a routine.
		For example:
		   f -> f ([])
		   f (a) -> f ([a])
		   f (a, b, c, d) -> f (a, [b, c], d)
		   f (a, b) -> f (a, [], b)
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2018, Eric Bezault and others"
	license: "MIT License"

class ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST

inherit

	ET_ACTUAL_ARGUMENT_LIST
		rename
			make as make_actual_argument_list
		redefine
			is_instance_free,
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_actual_arguments: detachable ET_ACTUAL_ARGUMENT_LIST; a_tuple_position, a_count: INTEGER)
			-- Create an unfolded tuple version of `a_actual_arguments',
			-- with manifest tuple at position `a_tuple_position' in the
			-- new list of actual arguments containing `a_count' arguments.
		require
			tuple_position_large_enough: a_tuple_position >= 1
			tuple_position_small_enough: a_tuple_position <= a_count
			without_actuals: a_actual_arguments = Void implies a_count = 1
			with_actuals: a_actual_arguments /= Void implies a_count <= a_actual_arguments.count + 1
		local
			l_tuple: ET_MANIFEST_TUPLE
			i, nb, nb_tuple: INTEGER
		do
			make_with_capacity (a_count)
			actual_arguments := a_actual_arguments
			if a_actual_arguments /= Void then
				left_symbol := a_actual_arguments.left_symbol
				right_symbol := a_actual_arguments.right_symbol
				nb_tuple := a_actual_arguments.count - a_count + 1
					-- Actual arguments after the tuple.
				from
					i := a_actual_arguments.count
					nb := a_tuple_position + nb_tuple
				until
					i < nb
				loop
					put_first (a_actual_arguments.actual_argument (i))
					i := i - 1
				end
					-- Tuple.
				create l_tuple.make_with_capacity (nb_tuple)
				from
				until
					i < a_tuple_position
				loop
					l_tuple.put_first (a_actual_arguments.actual_argument (i))
					i := i - 1
				end
				put_first (l_tuple)
					-- Actual arguments before the tuple.
				from
				until
					i < 1
				loop
					put_first (a_actual_arguments.actual_argument (i))
					i := i - 1
				end
			else
				create l_tuple.make
				put_first (l_tuple)
			end
		ensure
			count_set: count = a_count
		end

feature -- Access

	actual_arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			-- Actual arguments from which the current arguments are unfolded

feature -- Status report

	is_instance_free: BOOLEAN
			-- Are all arguments instance-free (i.e. not dependent
			-- on 'Current' or its attributes)?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := attached actual_arguments as l_actual_arguments implies l_actual_arguments.is_instance_free
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unfolded_tuple_actual_argument_list (Current)
		end

end
