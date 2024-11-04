note

	description:

		"Eiffel static feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_STATIC_FEATURE_CALL

inherit

	ET_QUALIFIED_CALL
		rename
			make as make_qualified_call
		undefine
			process
		redefine
			reset, position, first_leaf
		end

feature {NONE} -- Initialization

	make (a_type: like static_type; a_name: like qualified_name; args: like arguments)
			-- Create a new static feature call.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
			static_type := a_type
			make_qualified_call (a_name, args)
		ensure
			static_type_set: static_type = a_type
			name_set: qualified_name = a_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset
			-- Reset call as it was when it was last parsed.
		do
			precursor
			type.reset
			parenthesis_call := Void
		end

feature -- Access

	feature_keyword: detachable ET_KEYWORD
			-- 'feature' keyword

	static_type: ET_TARGET_TYPE
			-- Declared static type surrounded by braces

	type: ET_TYPE
			-- Static type
		do
			Result := static_type.type
		ensure
			type_not_void: Result /= Void
		end

	parenthesis_call: detachable ET_PARENTHESIS_CALL
			-- Unfolded form when the current static call is of the parenthesis alias form;
			-- For example, if the current static call is '{T}.f (args)', its parenthesis call
			-- will be '{T].f.g (args)' where 'g' is declared as 'g alias "()"'.

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached feature_keyword as l_feature_keyword and then not l_feature_keyword.position.is_null then
				Result := l_feature_keyword.position
			else
				Result := static_type.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached feature_keyword as l_feature_keyword then
				Result := l_feature_keyword
			else
				Result := static_type.first_leaf
			end
		end

feature -- Setting

	set_feature_keyword (a_feature: like feature_keyword)
			-- Set `feature_keyword' to `a_feature'.
		do
			feature_keyword := a_feature
		ensure
			feature_keyword_set: feature_keyword = a_feature
		end

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- Set `parenthesis_call' with `a_target', `a_name' and `a_arguments'.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
			a_arguments_not_void: a_arguments /= Void
			a_arguments_not_empty: a_arguments.count > 0
		deferred
		ensure
			parenthesis_call_set: attached parenthesis_call as l_parenthesis_call
			target_set: l_parenthesis_call.target = a_target
			name_set: l_parenthesis_call.name = a_name
			arguments_set: l_parenthesis_call.arguments = a_arguments
		end

invariant

	static_type_not_void: static_type /= Void

end
