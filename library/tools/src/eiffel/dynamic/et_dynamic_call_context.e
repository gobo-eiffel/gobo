note

	description:

		"Eiffel contexts for calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_CALL_CONTEXT

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_feature: like current_feature)
			-- Create a new call context.
		require
			a_feature_not_void: a_feature /= Void
		do
			create arguments.make (10)
			set_current_feature (a_feature)
		ensure
			current_feature_set: current_feature = a_feature
		end

feature -- Access

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature from which `target' and `arguments' are viewed

	target: ET_EXPRESSION
			-- Actual target of the call

	arguments: DS_ARRAYED_LIST [ET_EXPRESSION]
			-- Actual arguments of the call

feature -- Setting

	set_current_feature (a_feature: like current_feature)
			-- Set `current_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
		do
			current_feature := a_feature
			target := tokens.current_keyword
			arguments.wipe_out
			if attached a_feature.static_feature.arguments as l_arguments then
				nb := l_arguments.count
				from i := 1 until i > nb loop
					arguments.force_last (l_arguments.formal_argument (i).name)
					i := i + 1
				end
			end
		ensure
			current_feature_set: current_feature = a_feature
		end

	set_target (a_target: like target)
			-- Set `target' to `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

invariant

	current_feature_not_void: current_feature /= Void
	target_not_void: target /= Void
	arguments_not_void: arguments /= Void
	no_void_argument: not arguments.has_void

end
