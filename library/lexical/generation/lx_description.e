note

	description:

		"Lexical analyzer descriptions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_DESCRIPTION

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize with default values.
		do
			equiv_classes_used := True
			meta_equiv_classes_used := True
			characters_count := 256
			array_size := 1000
			line_pragma := True
			create rules.make (Initial_max_rules)
			create eof_rules.make (Initial_max_start_conditions)
			create eiffel_header.make (1)
			create start_conditions.make_with_initial (Initial_max_start_conditions)
		end

feature -- Initialization

	reset
			-- Reset scanner description with default values.
		do
			equiv_classes_used := True
			meta_equiv_classes_used := True
			characters_count := 256
			array_size := 1000
			rules.wipe_out
			eof_rules.wipe_out
			eiffel_header.wipe_out
			create start_conditions.make_with_initial (Initial_max_start_conditions)
			backing_up_report := False
			backing_up_filename := Void
			case_insensitive := False
			debug_mode := False
			full_table := False
			no_default_rule := False
			no_warning := False
			actions_separated := False
			inspect_used := False
			reject_used := False
			line_used := False
			position_used := False
			pre_action_used := False
			post_action_used := False
			pre_eof_action_used := False
			post_eof_action_used := False
			line_pragma := True
			input_filename := Void
			output_filename := Void
			equiv_classes := Void
			bol_needed := False
			variable_trail_context := False
			eiffel_code := Void
		end

feature -- User-defined options

	array_size: INTEGER
			-- Maximum size supported for manifest array
			-- ("-a" option)

	backing_up_report: BOOLEAN
			-- Should a backing-up report be generated?
			-- ("-b" option)

	backing_up_filename: STRING
			-- Filename for backing-up reports

	case_insensitive: BOOLEAN
			-- Should a case-insensitive scanner be generated?
			-- ("-i" option)

	characters_count: INTEGER
			-- Number of characters in character set handled by the
			-- generated scanner
			-- (Note: the character set is always assumed to start from 0.)

	debug_mode: BOOLEAN
			-- Should a debug-mode scanner be generated?
			-- ("-d" option)

	equiv_classes_used: BOOLEAN
			-- Should equivalence classes be used?
			-- ("-e" option)

	meta_equiv_classes_used: BOOLEAN
			-- Should meta-equivalence classes be used?
			-- ("-m" option)

	full_table: BOOLEAN
			-- Should the DFA state table not be compressed?
			-- ("-f" option)

	no_default_rule: BOOLEAN
			-- Should the default rule be suppressed?
			-- ("-s" option)

	no_warning: BOOLEAN
			-- Should warning messages be suppressed?
			-- ("-w" option)

	actions_separated: BOOLEAN
			-- Should each semantic action be generated into
			-- separate routine?
			-- ("-x" option)

	inspect_used: BOOLEAN
			-- Should the generated code uses an "inspect" instruction
			-- to find out which action to execute? The alternative is
			-- to use binary-search implemented with "if" instructions.
			-- ("-z" option)

	reject_used: BOOLEAN
			-- Is `reject' used in semantic actions?
			-- (Back-up tables must be generated.)
			-- (%option reject)

	line_used: BOOLEAN
			-- Should code for line/column reporting be generated?
			-- (%option line)

	position_used: BOOLEAN
			-- Should code for position reporting be generated?
			-- (%option position)

	pre_action_used: BOOLEAN
			-- Should routine `pre_action' be called before
			-- each semantic action? (%option pre-action)

	post_action_used: BOOLEAN
			-- Should routine `post_action' be called after
			-- each semantic action? (%option post-action)

	pre_eof_action_used: BOOLEAN
			-- Should routine `pre_eof_action' be called
			-- before each end-of-file semantic action?
			-- (%option pre-eof-action)

	post_eof_action_used: BOOLEAN
			-- Should routine `post_eof_action' be called
			-- after each end-of-file semantic action?
			-- (%option post-eof-action)

	line_pragma: BOOLEAN
			-- Should line pragma be generated?

	input_filename: STRING
			-- Name of input file

	output_filename: STRING
			-- Name of output file

feature -- Option setting

	set_array_size (i: INTEGER)
			-- Set `array_size' to `i'.
		require
			i_positive: i >= 0
		do
			array_size := i
		ensure
			array_size_set: array_size = i
		end

	set_backing_up_report (b: BOOLEAN)
			-- Set `backing_up_report' to `b'.
		do
			backing_up_report := b
		ensure
			backing_up_report_set: backing_up_report = b
		end

	set_backing_up_filename (a_filename: like backing_up_filename)
			-- Set `backing_up_filename' to `a_filename'.
		do
			backing_up_filename := a_filename
		ensure
			backing_up_filename_set: backing_up_filename = a_filename
		end

	set_case_insensitive (b: BOOLEAN)
			-- Set `case_insensitive' to `b'.
		do
			case_insensitive := b
		ensure
			case_insensitive_set: case_insensitive = b
		end

	set_characters_count (nb: INTEGER)
			-- Set `characters_count' to `nb'.
		require
			positive_nb: nb > 0
		do
			characters_count := nb
		ensure
			characters_count_set: characters_count = nb
		end

	set_debug_mode (b: BOOLEAN)
			-- Set `debug_mode' to `b'.
		do
			debug_mode := b
		ensure
			debug_mode_set: debug_mode = b
		end

	set_equiv_classes_used (b: BOOLEAN)
			-- Set `equiv_classes_used' to `b'.
		do
			equiv_classes_used := b
		ensure
			equiv_classes_used_set: equiv_classes_used = b
		end

	set_meta_equiv_classes_used (b: BOOLEAN)
			-- Set `meta_equiv_classes_used' to `b'.
		do
			meta_equiv_classes_used := b
		ensure
			meta_equiv_classes_used_set: meta_equiv_classes_used = b
		end

	set_full_table (b: BOOLEAN)
			-- Set `full_table' to `b'.
		do
			full_table := b
		ensure
			full_table_set: full_table = b
		end

	set_no_default_rule (b: BOOLEAN)
			-- Set `no_default_rule' to `b'.
		do
			no_default_rule := b
		ensure
			no_default_rule_set: no_default_rule = b
		end

	set_no_warning (b: BOOLEAN)
			-- Set `no_warning' to `b'.
		do
			no_warning := b
		ensure
			no_warning_set: no_warning = b
		end

	set_actions_separated (b: BOOLEAN)
			-- Set `actions_separated' to `b'.
		do
			actions_separated := b
		ensure
			actions_separated_set: actions_separated = b
		end

	set_inspect_used (b: BOOLEAN)
			-- Set `inspect_used' to `b'.
		do
			inspect_used := b
		ensure
			inspect_used_set: inspect_used = b
		end

	set_reject_used (b: BOOLEAN)
			-- Set `reject_used' to `b'.
		do
			reject_used := b
		ensure
			reject_used_set: reject_used = b
		end

	set_line_used (b: BOOLEAN)
			-- Set `line_used' to `b'.
		do
			line_used := b
		ensure
			line_used_set: line_used = b
		end

	set_position_used (b: BOOLEAN)
			-- Set `position_used' to `b'.
		do
			position_used := b
		ensure
			position_used_set: position_used = b
		end

	set_pre_action_used (b: BOOLEAN)
			-- Set `pre_action_used' to `b'.
		do
			pre_action_used := b
		ensure
			pre_action_used_set: pre_action_used = b
		end

	set_post_action_used (b: BOOLEAN)
			-- Set `post_action_used' to `b'.
		do
			post_action_used := b
		ensure
			post_action_used_set: post_action_used = b
		end

	set_pre_eof_action_used (b: BOOLEAN)
			-- Set `pre_eof_action_used' to `b'.
		do
			pre_eof_action_used := b
		ensure
			pre_eof_action_used_set: pre_eof_action_used = b
		end

	set_post_eof_action_used (b: BOOLEAN)
			-- Set `post_eof_action_used' to `b'.
		do
			post_eof_action_used := b
		ensure
			post_eof_action_used_set: post_eof_action_used = b
		end

	set_line_pragma (b: BOOLEAN)
			-- Set `line_pragma' to `b'.
		do
			line_pragma := b
		ensure
			line_pragma_set: line_pragma = b
		end

	set_input_filename (fn: like input_filename)
			-- Set `input_filename' to `fn'.
		do
			input_filename := fn
		ensure
			input_filename_set: input_filename = fn
		end

	set_output_filename (fn: like output_filename)
			-- Set `output_filename' to `fn'.
		do
			output_filename := fn
		ensure
			output_filename_set: output_filename = fn
		end

feature -- Access

	start_conditions: LX_START_CONDITIONS
			-- Start conditions used to generate start states

	rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules for semantic actions

	eof_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules for end-of-file semantic actions

	equiv_classes: LX_EQUIVALENCE_CLASSES
			-- Equivalence classes
			-- (Void when not `equiv_classes_used'.)

	bol_needed: BOOLEAN
			-- Does generated analyzer need "beginning
			-- of line" recognition?

	variable_trail_context: BOOLEAN
			-- Is there at least one rule with both variable-length
			-- head and trailing context?
			-- (Back-up tables must be generated.)

feature -- User-defined Eiffel code

	eiffel_code: STRING
			-- User-defined Eiffel code
			-- (Appears in section 3)

	eiffel_header: DS_ARRAYED_LIST [STRING]
			-- User-defined Eiffel header
			-- (Appears in section 1 between %{})

feature -- Setting

	set_start_conditions (scs: like start_conditions)
			-- Set `start_conditions' to `scs'.
		require
			scs_not_void: scs /= Void
		do
			start_conditions := scs
		ensure
			start_conditions_set: start_conditions = scs
		end

	set_rules (r: like rules)
			-- Set `rules' to `r'.
		require
			r_not_void: r /= Void
			no_void_rule: not r.has_void
		do
			rules := r
		ensure
			rules_set: rules = r
		end

	set_eof_rules (r: like eof_rules)
			-- Set `eof_rules' to `r'.
		require
			r_not_void: r /= Void
			no_void_rule: not r.has_void
		do
			eof_rules := r
		ensure
			eof_rules_set: eof_rules = r
		end

	set_equiv_classes (ec: like equiv_classes)
			-- Set `equiv_classes' to `ec'.
		require
			equiv_classes_used: ec /= Void implies equiv_classes_used
		do
			equiv_classes := ec
		ensure
			equiv_classes_set: equiv_classes = ec
		end

	create_equiv_classes
			-- Create `equiv_classes'.
		require
			equiv_classes_used: equiv_classes_used
		do
			create equiv_classes.make (1, characters_count)
		ensure
			equiv_classes_created: equiv_classes /= Void
			lower_set: equiv_classes.lower = 1
			upper_set: equiv_classes.upper = characters_count
		end

	set_bol_needed (b: like bol_needed)
			-- Set `bol_needed' to `b'.
		do
			bol_needed := b
		ensure
			bol_needed_set: bol_needed = b
		end

	set_variable_trail_context (b: like variable_trail_context)
			-- Set `variable_trail_context' to `b'.
		do
			variable_trail_context := b
		ensure
			variable_trail_context_set: variable_trail_context = b
		end

	set_eiffel_code (code: like eiffel_code)
			-- Set `eiffel_code' to `code'.
		do
			eiffel_code := code
		ensure
			eiffel_code_set: eiffel_code = code
		end

feature {NONE} -- Constants

	Initial_max_start_conditions: INTEGER = 40
			-- Maximum number of start conditions

	Initial_max_rules: INTEGER = 250
			-- Maximum number of rules

invariant

	rules_not_void: rules /= Void
	no_void_rule: not rules.has_void
	eof_rules_not_void: eof_rules /= Void
	no_void_eof_rule: not eof_rules.has_void
	start_conditions_not_void: start_conditions /= Void
	positive_characters_count: characters_count > 0
	eiffel_header_not_void: eiffel_header /= Void
	no_void_eiffel_header: not eiffel_header.has_void
	array_size_positive: array_size >= 0

end
