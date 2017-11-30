note

	description:

		"Eiffel tagged assertions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TAGGED_ASSERTION

inherit

	ET_ASSERTION
		redefine
			reset,
			is_class_assertion
		end

create

	make

feature {NONE} -- Initialization

	make (a_tag: like tag)
			-- Create a new assertion.
		require
			a_tag_not_void: a_tag /= Void
		do
			tag := a_tag
		ensure
			tag_set: tag = a_tag
		end

feature -- Initialization

	reset
			-- Reset assertion as it was when it was last parsed.
		do
			if attached untagged_assertion as l_untagged_assertion then
				l_untagged_assertion.reset
			end
		end

feature -- Status report

	is_class_assertion: BOOLEAN
			-- Does current assertion indicate that the associated feature is a class routine?
			-- A class routine is an instance-free feature which can be used in Non-object-calls
			-- of the form '{A}.f'.
		do
			if attached untagged_assertion as l_untagged_assertion then
				Result := l_untagged_assertion.is_class_assertion
			end
		end

feature -- Access

	tag: ET_TAG
			-- Tag

	untagged_assertion: detachable ET_UNTAGGED_ASSERTION
			-- Assertion with no tag

	expression: detachable ET_EXPRESSION
			-- Expression
		do
			if attached {ET_EXPRESSION} untagged_assertion as l_expression then
				Result := l_expression
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := tag.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := tag.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached untagged_assertion as l_untagged_assertion then
				Result := l_untagged_assertion.last_leaf
			else
				Result := tag.last_leaf
			end
		end

feature -- Setting

	set_untagged_assertion (a_untagged_assertion: like untagged_assertion)
			-- Set `untagged_assertion' to `a_untagged_assertion'.
		do
			untagged_assertion := a_untagged_assertion
		ensure
			untagged_assertion_set: untagged_assertion = a_untagged_assertion
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_tagged_assertion (Current)
		end

invariant

	tag_not_void: tag /= Void

end
