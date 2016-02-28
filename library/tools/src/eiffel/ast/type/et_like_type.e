note

	description:

		"Eiffel anchored types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_LIKE_TYPE

inherit

	ET_TYPE
		redefine
			type_mark,
			has_anchored_type,
			type_with_type_mark,
			resolved_formal_parameters,
			resolved_formal_parameters_with_type_mark
		end

	HASHABLE

feature -- Access

	type_mark: detachable ET_TYPE_MARK
			-- 'attached' or 'detachable' keyword,
			-- or '!' or '?' symbol

	like_keyword: ET_KEYWORD
			-- 'like' keyword
		deferred
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_LIKE_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := Current
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached type_mark as l_type_mark and then not l_type_mark.is_implicit_mark then
				Result := l_type_mark.first_leaf
			else
				Result := like_keyword
			end
		end

feature -- Status report

	has_anchored_type: BOOLEAN
			-- Does current type contain an anchored type?
		do
			Result := True
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_LIKE_TYPE
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		do
			Result := resolved_formal_parameters_with_type_mark (Void, a_parameters)
		end

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_LIKE_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := type_with_type_mark (a_type_mark)
		end

feature {NONE} -- Constants

	like_space: STRING = "like "
			-- Eiffel keywords

invariant

	like_keyword_not_void: like_keyword /= Void

end
