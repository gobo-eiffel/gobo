note

	description:
	"[
		Eiffel qualified anchored types of the form 'like a.b.c'
		or 'like Current.b.c' or 'like {A}.b.c'
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_LIKE_TYPE

inherit

	ET_QUALIFIED_LIKE_IDENTIFIER
		redefine
			resolved_formal_parameters_with_type_mark,
			type_with_type_mark
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_type: like target_type; a_name: like qualified_name)
			-- Create a new 'like a.b.c' type.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
			type_mark := a_type_mark
			target_type := a_type
			qualified_name := a_name
		ensure
			type_mark_set: type_mark = a_type_mark
			target_type_set: target_type = a_type
			qualified_name_set: qualified_name = a_name
		end

feature -- Access

	like_keyword: ET_KEYWORD
			-- 'like' keyword
		do
			Result := target_type.like_keyword
		end

	target_type: ET_LIKE_TYPE
			-- Target anchored type

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_QUALIFIED_LIKE_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark = type_mark then
				Result := Current
			else
				create Result.make (a_type_mark, target_type, qualified_name)
			end
		end

feature -- Type processing

	resolved_formal_parameters_with_type_mark (a_type_mark: detachable ET_TYPE_MARK; a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_QUALIFIED_LIKE_TYPE
			-- Same as `resolved_formal_parameters' except that the type mark status is
			-- overridden by `a_type_mark', if not Void
		local
			l_target_type: like target_type
			l_resolved_target_type: like target_type
			l_type_mark: detachable ET_TYPE_MARK
		do
			l_target_type := target_type
			l_resolved_target_type := l_target_type.resolved_formal_parameters (a_parameters)
			l_type_mark := overridden_type_mark (a_type_mark)
			if l_type_mark /= type_mark or l_target_type /= l_target_type then
				create Result.make (l_type_mark, l_resolved_target_type, qualified_name)
			else
				Result := Current
			end
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current type to `a_string'.
		do
			if attached type_mark as l_type_mark then
				if l_type_mark.is_implicit_mark then
					a_string.append_character ('[')
				end
				a_string.append_string (l_type_mark.text)
				if l_type_mark.is_implicit_mark then
					a_string.append_character (']')
				end
				a_string.append_character (' ')
			end
			target_type.append_to_string (a_string)
			a_string.append_character ('.')
			a_string.append_string (name.lower_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_qualified_like_type (Current)
		end

end
