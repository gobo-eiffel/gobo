indexing

	description:

		"Xace option clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OPTIONS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new option clause.
		do
			!! has_optimize.make_undefined
			!! has_require.make_undefined
			!! has_ensure.make_undefined
			!! has_invariant.make_undefined
			!! has_loop.make_undefined
			!! has_check.make_undefined
			!! has_debug.make_undefined
			!! debug_keys.make (Initial_debug_keys_capacity)
		end

feature -- Status report

	has_optimize: UT_TRISTATE
			-- Has 'optimize' option been set?

	has_require: UT_TRISTATE
			-- Has 'require' option been set?

	has_ensure: UT_TRISTATE
			-- Has 'ensure' option been set?

	has_invariant: UT_TRISTATE
			-- Has 'invariant' option been set?

	has_loop: UT_TRISTATE
			-- Has 'loop' option been set?

	has_check: UT_TRISTATE
			-- Has 'check' option been set?

	has_debug: UT_TRISTATE
			-- Has 'debug' option been set?

feature -- Access

	debug_keys: DS_HASH_TABLE [BOOLEAN, STRING]
			-- Debug keys (enabled or not)

feature -- Status setting

	set_optimize (b: BOOLEAN) is
			-- Set `has_optimize' to `b'.
		do
			if b then
				has_optimize.set_true
			else
				has_optimize.set_false
			end
		ensure
			optimize_not_undefined: not has_optimize.is_undefined
			optimize_set: has_optimize.is_true = b
		end

	set_require (b: BOOLEAN) is
			-- Set `has_require' to `b'.
		do
			if b then
				has_require.set_true
			else
				has_require.set_false
			end
		ensure
			require_not_undefined: not has_require.is_undefined
			require_set: has_require.is_true = b
		end

	set_ensure (b: BOOLEAN) is
			-- Set `has_ensure' to `b'.
		do
			if b then
				has_ensure.set_true
			else
				has_ensure.set_false
			end
		ensure
			ensure_not_undefined: not has_ensure.is_undefined
			ensure_set: has_ensure.is_true = b
		end

	set_invariant (b: BOOLEAN) is
			-- Set `has_invariant' to `b'.
		do
			if b then
				has_invariant.set_true
			else
				has_invariant.set_false
			end
		ensure
			invariant_not_undefined: not has_invariant.is_undefined
			invariant_set: has_invariant.is_true = b
		end

	set_loop (b: BOOLEAN) is
			-- Set `has_loop' to `b'.
		do
			if b then
				has_loop.set_true
			else
				has_loop.set_false
			end
		ensure
			loop_not_undefined: not has_loop.is_undefined
			loop_set: has_loop.is_true = b
		end

	set_check (b: BOOLEAN) is
			-- Set `has_check' to `b'.
		do
			if b then
				has_check.set_true
			else
				has_check.set_false
			end
		ensure
			check_not_undefined: not has_check.is_undefined
			check_set: has_check.is_true = b
		end

	set_debug (b: BOOLEAN) is
			-- Set `has_debug' to `b'.
		do
			if b then
				has_debug.set_true
			else
				has_debug.set_false
			end
		ensure
			debug_not_undefined: not has_debug.is_undefined
			debug_set: has_debug.is_true = b
		end

	set_debug_key (a_key: STRING; b: BOOLEAN) is
			-- Set debug key `a_key' to `b'.
		require
			a_key_not_void: a_key /= Void
		do
			debug_keys.force (b, a_key)
		end

feature {NONE} -- Constants

	Initial_debug_keys_capacity: INTEGER is 5
			-- Initial capacity for `debug_keys'

invariant

	optimize_not_void: has_optimize /= Void
	require_not_void: has_require /= Void
	ensure_not_void: has_ensure /= Void
	invariant_not_void: has_invariant /= Void
	loop_not_void: has_loop /= Void
	check_not_void: has_check /= Void
	debug_not_void: has_debug /= Void
	debug_keys_not_void: debug_keys /= Void
	no_void_debug_key: not debug_keys.has (Void)

end
