note

	description:

	"[
		Eiffel equality expressions at run-time.
		Needed to build the dynamic type sets of feature 'is_equal' which
		is internally called when the operands involved in the equality
		expressions are of expanded types.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_EQUALITY_EXPRESSION

inherit

	ET_DYNAMIC_TARGET

create

	make

feature {NONE} -- Initialization

	make (a_equality: like static_equality; a_target_type_set: like target_type_set
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new dynamic equality expression.
		require
			a_equality_not_void: a_equality /= Void
			a_target_type_set_not_void: a_target_type_set /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			static_equality := a_equality
			target_type_set := a_target_type_set
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			static_equality_set: static_equality = a_equality
			target_type_set_set: target_type_set = a_target_type_set
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	static_equality: ET_EQUALITY_EXPRESSION
			-- Static equality

	target_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of target for the internal call to 'is_equal'

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature where the equality expression appears

	current_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION
			-- Position of the equality expression
		do
			Result := static_equality.position
		ensure
			position_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `target_type_set' when
			-- `propagate_types' was last called

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		do
			propagate_type (a_type, a_system, a_system.dynamic_type_set_builder)
		end

	propagate_types (a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate types from `target_type_set' using `a_builder'.
		require
			a_builder_not_void: a_builder /= Void
		local
			l_count, old_count: INTEGER
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			old_count := count
			l_count := target_type_set.count
			if l_count /= old_count then
				nb := l_count - old_count
				count := l_count
				nb2 := target_type_set.count
				from j := nb2 until j < 1 loop
					propagate_type (target_type_set.dynamic_type (j), a_builder.current_dynamic_system, a_builder)
					i := i + 1
					if i < nb then
						j := j - 1
					else
						j := 0 -- Jump out of the loop.
					end
				end
				if i /= nb then
						-- Internal error: the type counts are corrupted.
					a_builder.set_fatal_error
					a_builder.error_handler.report_giaaa_error
				end
			end
		end

feature {NONE} -- Implementation

	propagate_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate `a_type' from `target_type_set' using `a_builder'.
		require
			a_type_not_void: a_type /= Void
			a_system_not_void: a_system /= Void
			a_builder_not_void: a_builder /= Void
		local
			l_dynamic_feature: detachable ET_DYNAMIC_FEATURE
		do
			if a_type.is_basic then
				-- For basic types, we have an optimization which avoids calling
				-- feature 'is_equal' internally. However this does not check
				-- whether 'is_equal' is indeed the expected standard built-in feature
				-- or it has been modified.
			elseif a_type.is_expanded then
					-- Feature 'is_equal' is called only when the operands are of expanded types.
				l_dynamic_feature := a_type.seeded_dynamic_query (a_system.current_system.is_equal_seed, a_system)
				if l_dynamic_feature = Void then
						-- Internal error: all classes should have a feature
						-- 'is_equal'. Otherwise we get an error when parsing
						-- class ANY if there is no such feature.
					a_builder.set_fatal_error
					a_builder.error_handler.report_giaaa_error
				else
					l_dynamic_feature.set_regular (True)
					a_builder.propagate_is_equal_argument_type (a_type, l_dynamic_feature)
				end
			end
		end

feature -- Link

	next: detachable like Current
			-- Next equality with the same target static type

	set_next (a_next: like next)
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

invariant

	static_equality_not_void: static_equality /= Void
	target_type_set_not_void: target_type_set /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end
