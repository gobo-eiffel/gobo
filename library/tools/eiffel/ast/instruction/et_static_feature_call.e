indexing

	description:

		"Eiffel static feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_type: like static_type; a_name: like qualified_name; args: like arguments) is
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

	reset is
			-- Reset call as it was when it was last parsed.
		do
			Precursor
			if type /= Void then
				type.reset
			end
		end

feature -- Status report

	is_expression: BOOLEAN is
			-- Is current call an expression?
		do
			-- Result := False
		end

	is_instruction: BOOLEAN is
			-- Is current call an instruction?
		do
			-- Result := False
		end

feature -- Access

	feature_keyword: ET_KEYWORD
			-- 'feature' keyword

	static_type: ET_TARGET_TYPE
			-- Declared static type surrounded by braces

	type: ET_TYPE is
			-- Static type
		do
			Result := static_type.type
		ensure
			type_not_void: Result /= Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if feature_keyword /= Void and then not feature_keyword.position.is_null then
				Result := feature_keyword.position
			else
				Result := static_type.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if feature_keyword /= Void then
				Result := feature_keyword
			else
				Result := static_type.first_leaf
			end
		end

feature -- Setting

	set_feature_keyword (a_feature: like feature_keyword) is
			-- Set `feature_keyword' to `a_feature'.
		do
			feature_keyword := a_feature
		ensure
			feature_keyword_set: feature_keyword = a_feature
		end

feature -- Conversion

	as_expression: ET_STATIC_CALL_EXPRESSION is
			-- `Current' viewed as an expression
		require
			is_expression: is_expression
		deferred
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_instruction: ET_STATIC_CALL_INSTRUCTION is
			-- `Current' viewed as an instruction
		require
			is_instruction: is_instruction
		deferred
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

invariant

	static_type_not_void: static_type /= Void

end
