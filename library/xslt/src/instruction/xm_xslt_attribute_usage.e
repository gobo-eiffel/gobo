note

	description: "Objects that represent xsl:use-attribute-sets,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006-2015, Colin Adams and others"
	license: "MIT License"
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

	make (a_executable: XM_XSLT_EXECUTABLE; a_sets: like attribute_sets)
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Type of items yielded
		do
			Result := attribute_node_kind_test
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:use-attribute-sets")
			std.error.put_string (a_string); std.error.put_new_line
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Preform context-independent static optimizations
		do
			a_replacement.put (Current)
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			check attached a_context.transformer as l_transformer then
				expand_attribute_sets (l_transformer.executable, attribute_sets, a_context)
			end
		end

feature {NONE} -- Implementation

	attribute_sets: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of used attribute sets

invariant

	attribute_sets_not_void: attribute_sets /= Void

end

