indexing

	description:

		"Lexical analyzer descriptions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_DESCRIPTION

creation

	make, make_from_description

feature {NONE} -- Initialization

	make is
			-- Initialize with default values.
		do
			equiv_classes_used := True
			meta_equiv_classes_used := True
			characters_count := 256
			array_size := 3000
			!! rules.make (Initial_max_rules)
			!! eof_rules.make (Initial_max_start_conditions)
			!! eiffel_header.make (1)
			!! start_conditions.make_with_initial (Initial_max_start_conditions)
		end

	make_from_description (other: like to_description) is
			-- Make a new scanner description with information from `other'.
		require
			other_not_void: other /= Void
		do
			from_description (other)
		ensure
			-- set: forall attribute, attribute = other.attribute
		end

feature -- Initialization

	reset is
			-- Reset scanner description with default values.
		do
			equiv_classes_used := True
			meta_equiv_classes_used := True
			characters_count := 256
			array_size := 3000
			rules.wipe_out
			eof_rules.wipe_out
			eiffel_header.wipe_out
			!! start_conditions.make_with_initial (Initial_max_start_conditions)
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
			user_action_used := False
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
			-- [Note: the character set is always assumed to start from 0.]

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

	user_action_used: BOOLEAN
			-- Should routine `user_action' be called before
			-- each semantic action?

	input_filename: STRING
			-- Name of input file

	output_filename: STRING
			-- Name of output file

feature -- Option setting

	set_array_size (i: INTEGER) is
			-- Set `array_size' to `i'.
		require
			i_positive: i >= 0
		do
			array_size := i
		ensure
			array_size_set: array_size = i
		end

	set_backing_up_report (b: like backing_up_report) is
			-- Set `backing_up_report' to `b'.
		do
			backing_up_report := b
		ensure
			backing_up_report_set: backing_up_report = b
		end

	set_backing_up_filename (a_filename: like backing_up_filename) is
			-- Set `backing_up_filename' to `a_filename'.
		do
			backing_up_filename := a_filename
		ensure
			backing_up_filename_set: backing_up_filename = a_filename
		end

	set_case_insensitive (b: like case_insensitive) is
			-- Set `case_insensitive' to `b'.
		do
			case_insensitive := b
		ensure
			case_insensitive_set: case_insensitive = b
		end

	set_characters_count (nb: like characters_count) is
			-- Set `characters_count' to `nb'.
		require
			positive_nb: nb > 0
		do
			characters_count := nb
		ensure
			characters_count_set: characters_count = nb
		end

	set_debug_mode (b: like debug_mode) is
			-- Set `debug_mode' to `b'.
		do
			debug_mode := b
		ensure
			debug_mode_set: debug_mode = b
		end

	set_equiv_classes_used (b: like equiv_classes_used) is
			-- Set `equiv_classes_used' to `b'.
		do
			equiv_classes_used := b
		ensure
			equiv_classes_used_set: equiv_classes_used = b
		end

	set_meta_equiv_classes_used (b: like meta_equiv_classes_used) is
			-- Set `meta_equiv_classes_used' to `b'.
		do
			meta_equiv_classes_used := b
		ensure
			meta_equiv_classes_used_set: meta_equiv_classes_used = b
		end

	set_full_table (b: like full_table) is
			-- Set `full_table' to `b'.
		do
			full_table := b
		ensure
			full_table_set: full_table = b
		end

	set_no_default_rule (b: like no_default_rule) is
			-- Set `no_default_rule' to `b'.
		do
			no_default_rule := b
		ensure
			no_default_rule_set: no_default_rule = b
		end

	set_no_warning (b: like no_warning) is
			-- Set `no_warning' to `b'.
		do
			no_warning := b
		ensure
			no_warning_set: no_warning = b
		end

	set_actions_separated (b: like actions_separated) is
			-- Set `actions_separated' to `b'.
		do
			actions_separated := b
		ensure
			actions_separated_set: actions_separated = b
		end

	set_inspect_used (b: like inspect_used) is
			-- Set `inspect_used' to `b'.
		do
			inspect_used := b
		ensure
			inspect_used_set: inspect_used = b
		end

	set_reject_used (b: like reject_used) is
			-- Set `reject_used' to `b'.
		do
			reject_used := b
		ensure
			reject_used_set: reject_used = b
		end

	set_user_action_used (b: like user_action_used) is
			-- Set `user_action_used' to `b'.
		do
			user_action_used := b
		ensure
			user_action_used_set: user_action_used = b
		end

	set_input_filename (fn: like input_filename) is
			-- Set `input_filename' to `fn'.
		do
			input_filename := fn
		ensure
			input_filename_set: input_filename = fn
		end

	set_output_filename (fn: like output_filename) is
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

	set_start_conditions (scs: like start_conditions) is
			-- Set `start_conditions' to `scs'.
		require
			scs_not_void: scs /= Void
		do
			start_conditions := scs
		ensure
			start_conditions_set: start_conditions = scs
		end

	set_rules (r: like rules) is
			-- Set `rules' to `r'.
		require
			r_not_void: r /= Void
			no_void_rule: not r.has (void)
		do
			rules := r
		ensure
			rules_set: rules = r
		end

	set_eof_rules (r: like eof_rules) is
			-- Set `eof_rules' to `r'.
		require
			r_not_void: r /= Void
			no_void_rule: not r.has (void)
		do
			eof_rules := r
		ensure
			eof_rules_set: eof_rules = r
		end

	set_equiv_classes (ec: like equiv_classes) is
			-- Set `equiv_classes' to `ec'.
		require
			equiv_classes_used: ec /= Void implies equiv_classes_used
		do
			equiv_classes := ec
		ensure
			equiv_classes_set: equiv_classes = ec
		end

	set_bol_needed (b: like bol_needed) is
			-- Set `bol_needed' to `b'.
		do
			bol_needed := b
		ensure
			bol_needed_set: bol_needed = b
		end

	set_variable_trail_context (b: like variable_trail_context) is
			-- Set `variable_trail_context' to `b'.
		do
			variable_trail_context := b
		ensure
			variable_trail_context_set: variable_trail_context = b
		end

	set_eiffel_code (code: like eiffel_code) is
			-- Set `eiffel_code' to `code'.
		do
			eiffel_code := code
		ensure
			eiffel_code_set: eiffel_code = code
		end

feature -- Conversion

	from_description (other: like to_description) is
			-- Set current scanner description data with
			-- information from `other'.
		require
			other_not_void: other /= Void
		do
			array_size := other.array_size
			backing_up_report := other.backing_up_report
			backing_up_filename := other.backing_up_filename
			case_insensitive := other.case_insensitive
			characters_count := other.characters_count
			debug_mode := other.debug_mode
			equiv_classes_used := other.equiv_classes_used
			meta_equiv_classes_used := other.meta_equiv_classes_used
			full_table := other.full_table
			no_default_rule := other.no_default_rule
			no_warning := other.no_warning
			actions_separated := other.actions_separated
			inspect_used := other.inspect_used
			reject_used := other.reject_used
			user_action_used := other.user_action_used
			input_filename := other.input_filename
			output_filename := other.output_filename
			start_conditions := other.start_conditions
			rules := other.rules
			eof_rules := other.eof_rules
			equiv_classes := other.equiv_classes
			bol_needed := other.bol_needed
			variable_trail_context := other.variable_trail_context
			eiffel_code := other.eiffel_code
			eiffel_header := other.eiffel_header
		ensure
			-- set: forall attribute, attribute = other.attribute
		end

	to_description: LX_DESCRIPTION is
			-- New scanner description made from current description
		do
			!! Result.make_from_description (Current)
		ensure
			description_not_void: Result /= Void
			-- set: forall attribute, Result.attribute = attribute
		end

feature {NONE} -- Constants

	Initial_max_start_conditions: INTEGER is 40
			-- Maximum number of start conditions

	Initial_max_rules: INTEGER is 250
			-- Maximum number of rules

feature -- Not supported yet

--	fast_table: BOOLEAN
--			-- Should the Jacobson method of table representation be used?
--			-- ("-F" option)

--	trace_mode: BOOLEAN
--			-- Should the program run in trace mode?
--			-- ("-T" option)

--	print_stats: BOOLEAN
--			-- Should statistics be dumped?
--			-- ("-v" option)

--	set_fast_table (b: like fast_table) is
--			-- Set `fast_table' to `b'.
--		do
--			fast_table := b
--		ensure
--			fast_table_set: fast_table = b
--		end

--	set_trace_mode (b: like trace_mode) is
--			-- Set `trace_mode' to `b'.
--		do
--			trace_mode := b
--		ensure
--			trace_mode_set: trace_mode = b
--		end

--	set_print_stats (b: like print_stats) is
--			-- Set `print_stats' to `b'.
--		do
--			print_stats := b
--		ensure
--			print_stats_set: print_stats = b
--		end

invariant

	rules_not_void: rules /= Void
	no_void_rule: not rules.has (Void)
	eof_rules_not_void: eof_rules /= Void
	no_void_eof_rule: not eof_rules.has (Void)
	start_conditions_not_void: start_conditions /= void
	positive_characters_count: characters_count > 0
	eiffel_header_not_void: eiffel_header /= Void
	no_void_eiffel_header: not eiffel_header.has (Void)
	array_size_positive: array_size >= 0

end -- class LX_DESCRIPTION
