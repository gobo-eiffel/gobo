indexing

	description:

		"Eiffel actual generic parameters with qualifiers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_ACTUAL_PARAMETER

inherit

	ET_ACTUAL_PARAMETER
		redefine
			resolved_formal_parameters,
			has_cat_parameter_mark
		end

creation

	make

feature {NONE} -- Initialization

	make (a_type: ET_TYPE) is
			-- Create a new qualified actual parameter.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Status report

	is_cat_parameter (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is current actual parameter a non-conforming parameter
			-- when viewed from `a_context' in `a_universe'?
		do
			Result := cat_keyword /= Void
			if not Result then
				Result := type.is_cat_parameter (a_context, a_universe)
			end
		end

	has_cat_parameter_mark: BOOLEAN is
			-- Has the keyword 'cat' been specified for current actual parameter?
		do
			Result := (cat_keyword /= Void)
		ensure then
			definition: Result = (cat_keyword /= Void)
		end

	named_parameter_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Does the named parameter of current type contain `a_class'
			-- when it appears in `a_context' in `a_universe'?
		do
			Result := type.named_type_has_class (a_class, a_context, a_universe)
		end

feature -- Access

	type: ET_TYPE
			-- Type of actual parameter

	cat_keyword: ET_KEYWORD
			-- 'cat' keyword

	named_parameter (a_context: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_ACTUAL_PARAMETER is
			-- Same as current actual parameter but its type
			-- replaced by its named type
		local
			a_named_type: ET_NAMED_TYPE
			a_qualified_parameter: ET_QUALIFIED_ACTUAL_PARAMETER
		do
			a_named_type := type.named_type (a_context, a_universe)
			if a_named_type = type then
				Result := Current
			else
				create a_qualified_parameter.make (a_named_type)
				a_qualified_parameter.set_cat_keyword (cat_keyword)
				a_qualified_parameter.set_unresolved_parameter (Current)
				Result := a_qualified_parameter
			end
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if cat_keyword /= Void then
				Result := cat_keyword.position
			else
				Result := type.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if cat_keyword /= Void then
				Result := cat_keyword
			else
				Result := type.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := type.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := type.break
		end

	unresolved_parameter: ET_QUALIFIED_ACTUAL_PARAMETER
			-- Actual parameter from which current parameter is a resolved version

feature -- Setting

	set_cat_keyword (a_cat: like cat_keyword) is
			-- Set `cat_keyword' to `a_cat'.
		do
			cat_keyword := a_cat
			if unresolved_parameter /= Void then
				unresolved_parameter.set_cat_keyword (a_cat)
			end
		ensure
			cat_keyword_set: cat_keyword = a_cat
		end

	set_unresolved_parameter (a_parameter: like unresolved_parameter) is
			-- Set `unresolved_parameter' to `a_parameter'.
		do
			unresolved_parameter := a_parameter
		ensure
			unresolved_parameter_set: unresolved_parameter = a_parameter
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER is
			-- Version of current actual parameter where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		local
			a_resolved_type: ET_TYPE
			a_qualified_parameter: ET_QUALIFIED_ACTUAL_PARAMETER
		do
			a_resolved_type := type.resolved_formal_parameters (a_parameters)
			if a_resolved_type = type then
				Result := Current
			else
				create a_qualified_parameter.make (a_resolved_type)
				a_qualified_parameter.set_cat_keyword (cat_keyword)
				a_qualified_parameter.set_unresolved_parameter (Current)
				Result := a_qualified_parameter
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			type.process (a_processor)
		end

end
