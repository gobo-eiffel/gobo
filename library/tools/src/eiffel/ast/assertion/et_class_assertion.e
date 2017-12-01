note

	description:

	"[
		Eiffel assertions indicating that the associated feature is a class routine.
		A class routine is an instance-free feature which can be used in Non-object-calls
		of the form '{A}.f'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_ASSERTION

inherit

	ET_UNTAGGED_ASSERTION
		redefine
			is_class_assertion
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new 'class' assertion.
		do
			class_keyword := tokens.class_keyword
		end

feature -- Status report

	is_class_assertion: BOOLEAN = True
			-- Does current assertion indicate that the associated feature is a class routine?
			-- A class routine is an instance-free feature which can be used in Non-object-calls
			-- of the form '{A}.f'.

feature -- Access

	class_keyword: ET_KEYWORD
			-- 'class' keyword

	expression: detachable ET_EXPRESSION
			-- Expression
		do
			-- Result := Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := class_keyword.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := class_keyword.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := class_keyword.last_leaf
		end

feature -- Setting

	set_class_keyword (a_keyword: like class_keyword)
			-- Set `class_keyword' to `a_keyword'.
		do
			class_keyword := a_keyword
		ensure
			class_keyword_set: class_keyword = a_keyword
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_class_assertion (Current)
		end

invariant

	class_keyword_not_void: class_keyword /= Void

end
