note

	description:

		"Eiffel postcondition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_POSTCONDITIONS

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
			-- Create a new postcondition clause.
		do
			ensure_keyword := tokens.ensure_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new postcondition clause with capacity `nb'.
		do
			ensure_keyword := tokens.ensure_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset postconditions as they were just after they were last parsed.
		do
			if validity_checked then
				precursor
				reset_validity_checked
			end
		end

feature -- Access

	ensure_keyword: ET_KEYWORD
			-- 'ensure' keyword

	then_keyword: detachable ET_KEYWORD
			-- 'then' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := ensure_keyword.position
			if Result.is_null then
				if not is_empty then
					Result := first.position
				elseif attached then_keyword as l_then_keyword then
					Result := l_then_keyword.position
				elseif attached first_semicolon as l_first_semicolon then
					Result := l_first_semicolon.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := ensure_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			elseif attached first_semicolon as l_first_semicolon then
				Result := l_first_semicolon.last_leaf
			elseif attached then_keyword as l_then_keyword then
				Result := l_then_keyword
			else
				Result := ensure_keyword
			end
		end

feature -- Status report

	is_ensure_then: BOOLEAN
			-- Has postcondition clause been declared with "ensure then"?
		do
			Result := (then_keyword /= Void)
		end

feature -- Setting

	set_ensure_keyword (an_ensure: like ensure_keyword)
			-- Set `ensure_keyword' to `an_ensure'.
		require
			an_ensure_not_void: an_ensure /= Void
		do
			ensure_keyword := an_ensure
		ensure
			ensure_keyword_set: ensure_keyword = an_ensure
		end

	set_then_keyword (a_then: like then_keyword)
			-- Set `else_keyword' to `an_else'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Validity checking status

	validity_checked: BOOLEAN
			-- Has the validity of current postconditions been checked?

	has_validity_error: BOOLEAN
			-- Has a fatal error occurred during postconditions validity checking?

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
			a_processor.process_postconditions (Current)
		end

invariant

	ensure_keyword_not_void: ensure_keyword /= Void

end
