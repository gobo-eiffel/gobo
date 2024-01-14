note

	description:

		"Eiffel create expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2023, Eric Bezault and others"
	license: "MIT License"

class ET_CREATE_EXPRESSION

inherit

	ET_CREATION_EXPRESSION
		redefine
			reset,
			is_instance_free
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like creation_type; a_call: like creation_call)
			-- Create a new create expression.
		require
			a_type_not_void: a_type /= Void
		do
			creation_type := a_type
			creation_call := a_call
			create_keyword := tokens.create_keyword
		ensure
			creation_type_set: creation_type = a_type
			creation_call_set: creation_call = a_call
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			type.reset
			if attached creation_call as l_creation_call then
				l_creation_call.reset
			end
			if attached default_create_name as l_default_create_name then
				l_default_create_name.reset
			end
			if attached internal_separate_target as l_internal_separate_target then
				l_internal_separate_target.reset
			end
		end

feature -- Access

	create_keyword: ET_KEYWORD
			-- 'create' keyword

	creation_region: detachable ET_CREATION_REGION
			-- Creation region (for SCOOP)

	creation_type: ET_TARGET_TYPE
			-- Creation type surrounded by braces

	type: ET_TYPE
			-- Creation type
		do
			Result := creation_type.type
		end

	creation_call: detachable ET_QUALIFIED_CALL
			-- Call to creation procedure

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not create_keyword.position.is_null then
				Result := create_keyword.position
			else
				Result := creation_type.position
			end
		end

	type_position: ET_POSITION
			-- Position of `type'
		do
			Result := type.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := create_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached creation_call as l_creation_call then
				Result := l_creation_call.last_leaf
			else
				Result := creation_type.last_leaf
			end
		end

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := attached arguments as l_arguments implies l_arguments.is_instance_free
		end

feature -- Setting

	set_create_keyword (a_create: like create_keyword)
			-- Set `create_keyword' to `a_create'.
		require
			a_create_not_void: a_create /= Void
		do
			create_keyword := a_create
		ensure
			create_keyword_set: create_keyword = a_create
		end

	set_creation_region (a_region: like creation_region)
			-- Set `creation_region' to `a_region'.
		do
			creation_region := a_region
		ensure
			creation_region_set: creation_region = a_region
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_create_expression (Current)
		end

invariant

	create_keyword_not_void: create_keyword /= Void
	creation_type_not_void: creation_type /= Void

end
