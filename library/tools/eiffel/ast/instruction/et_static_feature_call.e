indexing

	description:

		"Eiffel static feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			reset, position
		end

feature {NONE} -- Initialization

	make (a_type: like static_type; a_name: like qualified_name; args: like arguments) is
			-- Create a new static feature call.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
			static_type := a_type
			feature_keyword := tokens.feature_keyword
			make_qualified_call (a_name, args)
		ensure
			static_type_set: static_type = a_type
			name_set: qualified_name = a_name
			arguments_set: arguments = args
		end

feature -- Initialization

	reset is
			-- Reset call as it was when it was first parsed.
		do
			Precursor
			if type /= Void then
				type.reset
			end
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
			if not feature_keyword.position.is_null then
				Result := feature_keyword.position
			else
				Result := static_type.position
			end
		end

feature -- Setting

	set_feature_keyword (a_feature: like feature_keyword) is
			-- Set `feature_keyword' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			feature_keyword := a_feature
		ensure
			feature_keyword_set: feature_keyword = a_feature
		end

invariant

	feature_keyword_not_void: feature_keyword /= Void
	static_type_not_void: static_type /= Void

end
