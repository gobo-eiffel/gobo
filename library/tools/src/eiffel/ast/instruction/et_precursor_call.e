note

	description:

		"Eiffel precursor calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PRECURSOR_CALL

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENT_LIST
		rename
			name as precursor_keyword
		end

feature {NONE} -- Initialization

	make (a_parent_name: like parent_name; args: like arguments)
			-- Create a new precursor call.
		do
			parent_name := a_parent_name
			arguments := args
			precursor_keyword := tokens.precursor_keyword
		ensure
			parent_name_set: parent_name = a_parent_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset
			-- Reset precursor as it was when it was last parsed.
		do
				-- Note: do not reset `parent_type' to Void. `parent_type'
				-- is set by the feature flattener regardless of whether
				-- it was already set or not. It is then used by the
				-- implementation checker. So we don't want to reset things
				-- set by the feature flattener if we only want to reset
				-- what the implementation checker did, and especially since
				-- it does not hurt to leave it there.
			reset_arguments
			parenthesis_call := Void
		end

feature -- Access

	precursor_keyword: ET_PRECURSOR_KEYWORD
			-- 'precursor' keyword

	parent_name: detachable ET_PRECURSOR_CLASS_NAME
			-- Parent class name surrounded by braces

	parent_type: detachable ET_BASE_TYPE
			-- Parent type;
			-- Void if not resolved yet.

	parenthesis_call: detachable ET_PARENTHESIS_CALL
			-- Unfolded form when the current precursor call is of the parenthesis alias form;
			-- For example, if the current precursor call is 'precursor (args)', its parenthesis call
			-- will be 'precursor.g (args)' where 'g' is declared as 'g alias "()"'.

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if is_parent_prefixed and then attached parent_name as l_parent_name then
				Result := l_parent_name.position
			else
				Result := precursor_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if is_parent_prefixed and then attached parent_name as l_parent_name then
				Result := l_parent_name.first_leaf
			else
				Result := precursor_keyword
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached arguments as l_arguments then
				Result := l_arguments.last_leaf
			elseif not is_parent_prefixed and then attached parent_name as l_parent_name then
				Result := l_parent_name.last_leaf
			else
				Result := precursor_keyword
			end
		end

feature -- Setting

	set_precursor_keyword (a_precursor: like precursor_keyword)
			-- Set `precursor_keyword' to `a_precursor'.
		require
			a_precursor_not_void: a_precursor /= Void
		do
			precursor_keyword := a_precursor
		ensure
			precursor_keyword_set: precursor_keyword = a_precursor
		end

	set_parent_type (a_parent_type: like parent_type)
			-- Set `parent_type' to `a_parent_type'.
		do
			parent_type := a_parent_type
		ensure
			parent_type_set: parent_type = a_parent_type
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

feature -- Status report

	is_parent_prefixed: BOOLEAN
			-- Does parent clause appear before 'precursor' keyword?

feature -- Status setting

	set_parent_prefixed (b: BOOLEAN)
			-- Set `is_parent_prefixed' to `b'.
		do
			is_parent_prefixed := b
		ensure
			is_parent_prefixed_set: is_parent_prefixed = b
		end

invariant

	precursor_keyword_not_void: precursor_keyword /= Void

end
