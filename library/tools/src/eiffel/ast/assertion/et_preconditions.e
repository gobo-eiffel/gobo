note

	description:

		"Eiffel precondition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"

class ET_PRECONDITIONS

inherit

	ET_ASSERTIONS
		redefine
			make,
			make_with_capacity,
			reset
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new precondition clause.
		do
			require_keyword := tokens.require_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new precondition clause with capacity `nb'.
		do
			require_keyword := tokens.require_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset preconditions as they were just after they were last parsed.
		do
			if validity_checked then
				precursor
				reset_validity_checked
			end
		end

feature -- Access

	require_keyword: ET_KEYWORD
			-- 'require' keyword

	else_keyword: detachable ET_KEYWORD
			-- 'else' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := require_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := require_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			elseif attached else_keyword as l_else_keyword then
				Result := l_else_keyword
			else
				Result := require_keyword
			end
		end

feature -- Status report

	is_require_else: BOOLEAN
			-- Has precondition clause been declared with "require else"?
		do
			Result := (else_keyword /= Void)
		end

feature -- Setting

	set_require_keyword (a_require: like require_keyword)
			-- Set `require_keyword' to `a_require'.
		require
			a_require_not_void: a_require /= Void
		do
			require_keyword := a_require
		ensure
			require_keyword_set: require_keyword = a_require
		end

	set_else_keyword (an_else: like else_keyword)
			-- Set `else_keyword' to `an_else'.
		do
			else_keyword := an_else
		ensure
			else_keyword_set: else_keyword = an_else
		end

feature -- Validity checking status

	validity_checked: BOOLEAN
			-- Has the validity of current preconditions been checked?

	has_validity_error: BOOLEAN
			-- Has a fatal error occurred during preconditions validity checking?

	set_validity_checked
			-- Set `validity_checked' to True.
		do
			validity_checked := True
		ensure
			validity_checked: validity_checked
		end

	set_validity_error
			-- Set `has_validity_error' to True.
		do
			has_validity_error := True
		ensure
			has_validity_error: has_validity_error
		end

	reset_validity_checked
			-- Set `validity_checked' to False.
		do
			has_validity_error := False
			validity_checked := False
		ensure
			validity_not_checked: not validity_checked
			no_validity_error: not has_validity_error
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_preconditions (Current)
		end

invariant

	require_keyword_not_void: require_keyword /= Void

end
