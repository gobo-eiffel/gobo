indexing

	description: "Objects that represent xsl:use-attribute-sets,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ATTRIBUTE_USAGE

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			item_type
		end

	XM_XSLT_ATTRIBUTE_SET_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_executable: XM_XSLT_EXECUTABLE; a_sets: like attribute_sets) is
			-- Initialize `Current'.
		require
			a_executable_not_void: a_executable /= Void
			a_sets_not_void: a_sets /= Void
		do
			executable := a_executable
			attribute_sets := a_sets
		ensure
			executable_set: executable = a_executable
			attribute_sets_set: attribute_sets = a_sets
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type of items yielded
		do
			Result := attribute_node_kind_test
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:use-attribute-sets")
			std.error.put_string (a_string); std.error.put_new_line
		end

feature -- Optimization

	simplify is
			-- Preform context-independent static optimizations
		do
			-- do_nothing
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			-- do_nothing
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			-- do_nothing
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			expand_attribute_sets (a_context.transformer.executable, attribute_sets, a_context)
		end

feature {NONE} -- Implementation

	attribute_sets: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of used attribute sets

invariant

	attribute_sets_not_void: attribute_sets /= Void

end
	
