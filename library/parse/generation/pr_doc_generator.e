indexing

	description:

		"Grammar documentation generators"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class PR_DOC_GENERATOR

inherit

	ANY

feature {NONE} -- Initialization

	make (a_grammar: like grammar) is
			-- Create a new documentation generator
			-- associated with `a_grammar'.
		require
			a_grammar_not_void: a_grammar /= Void
		do
			grammar := a_grammar
		ensure
			grammar_set: grammar = a_grammar
		end

feature -- Status report

	lhs_shared: BOOLEAN
			-- Should two or more successive rules with the
			-- same lhs be merged?

feature -- Status setting

	set_lhs_shared (b: BOOLEAN) is
			-- Set `lhs_shared' to `b'.
		do
			lhs_shared := b
		ensure
			lhs_shared_set: lhs_shared = b
		end

feature -- Access

	grammar: PR_GRAMMAR
			-- Associated grammar

feature -- Generation

	print_grammar (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print documentation about `grammar' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_grammar_header (a_file)
			print_rules (a_file)
			print_grammar_footer (a_file)
		end

feature {NONE} -- Generation

	print_grammar_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_grammar_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_rules (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rules to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			a_rules: DS_ARRAYED_LIST [PR_RULE]
			a_rule: PR_RULE
			a_lhs, last_lhs: PR_VARIABLE
		do
			a_rules := grammar.rules
			nb := a_rules.count
			from i := 1 until i > nb loop
				a_rule := a_rules.item (i)
				a_lhs := a_rule.lhs
					-- Do not take internal rules into account.
				if a_lhs.name.item (1) /= '@' then
					if lhs_shared and then last_lhs = a_lhs then
						print_next_rhs_header (a_file)
						print_rhs (a_rule.rhs, a_file)
						print_next_rhs_footer (a_file)
					else
						if lhs_shared and then last_lhs /= Void then
							print_rule_footer (a_file)
						end
						print_rule_header (a_file)
						print_lhs (a_rule.lhs, a_file)
						print_first_rhs_header (a_file)
						print_rhs (a_rule.rhs, a_file)
						print_first_rhs_footer (a_file)
						last_lhs := a_lhs
					end
					if not lhs_shared then
						print_rule_footer (a_file)
					end
				end
				i := i + 1
			end
			if lhs_shared and then last_lhs /= Void then
				print_rule_footer (a_file)
			end
		end

	print_rule_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_rule_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_lhs (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the left-hand side of a rule) to `a_file'.
		require
			a_variable_not_void: a_variable /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_rhs (a_rhs: DS_ARRAYED_LIST [PR_SYMBOL]; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_rhs' to `a_file'.
		require
			a_rhs_not_void: a_rhs /= Void
			no_void_rhs: not a_rhs.has (Void)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			a_token: PR_TOKEN
			a_variable: PR_VARIABLE
		do
			if a_rhs.is_empty then
				print_empty_rhs (a_file)
			else
				nb := a_rhs.count
				from i := 1 until i > nb loop
					a_token ?= a_rhs.item (i)
					if a_token /= Void then
						print_token (a_token, a_file)
					else
						a_variable ?= a_rhs.item (i)
							-- Do not take internal rules into account.
						if a_variable /= Void and then a_variable.name.item (1) /= '@' then
							print_variable (a_variable, a_file)
						end
					end
					i := i + 1
				end
			end
		end

	print_first_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_first_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_next_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_next_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation footer to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_token (a_token: PR_TOKEN; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_token' to `a_file'.
		require
			a_token_not_void: a_token /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_variable (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the right-hand side of a rule) to `a_file'.
		require
			a_variable_not_void: a_variable /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	print_empty_rhs (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print an right-hand side of a rule to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

invariant

	grammar_not_void: grammar /= Void

end
