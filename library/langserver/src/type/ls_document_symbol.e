note

	description:
	"[
		LSP document symbols.

		Represent programming constructs like variables, classes, interfaces etc.
		that appear in a document. Document symbols can be hierarchical and they
		have two ranges: one that encloses its definition and one that points to its
		most interesting range, e.g. the range of an identifier.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_detail: like detail; a_kind: like kind; a_tags: like tags;
		a_deprecated: like deprecated; a_range: like range; a_selection_range: like selection_range;
		a_children: like children)
			-- Create a new document symbol.
		require
			a_name_not_void: a_name /= Void
			a_kind_not_void: a_kind /= Void
			a_range_not_void: a_range /= Void
			a_selection_range_not_void: a_selection_range /= Void
		do
			name := a_name
			detail := a_detail
			kind := a_kind
			tags := a_tags
			deprecated := a_deprecated
			range := a_range
			selection_range := a_selection_range
			children := a_children
		ensure
			name_set: name = a_name
			detail_set: detail = a_detail
			kind_set: kind = a_kind
			tags_set: tags = a_tags
			deprecated_set: deprecated = a_deprecated
			range_set: range = a_range
			selection_range_set: selection_range = a_selection_range
			children_set: children = a_children
		end

feature -- Access

	name: LS_STRING
			-- The name of this symbol. Will be displayed in the user interface and
			-- therefore must not be an empty string or a string only consisting of
			-- white spaces.

	detail: detachable LS_STRING
			-- More detail for this symbol, e.g the signature of a function.

	kind: LS_SYMBOL_KIND
			-- The kind of this symbol.

	tags: detachable LS_SYMBOL_TAG_LIST
			-- Tags for this document symbol.

	deprecated: detachable LS_BOOLEAN
			-- Indicates if this symbol is deprecated.
			--
			-- Deprecated: Use tags instead

	range: LS_RANGE
			-- The range enclosing this symbol not including leading/trailing whitespace
			-- but everything else like comments. This information is typically used to
			-- determine if the clients cursor is inside the symbol to reveal it  in the
			-- UI.

	selection_range: LS_RANGE
			-- The range that should be selected and revealed when this symbol is being
			-- picked, e.g. the name of a function. Must be contained by the `range`.

	children: detachable LS_DOCUMENT_SYMBOL_LIST
			-- Children of this symbol, e.g. properties of a class.

feature -- Setting

	add_child (a_document_symbol: LS_DOCUMENT_SYMBOL)
			-- Add `a_document_symbol` to `children`.
		require
			a_document_symbol_not_void: a_document_symbol /= Void
		local
			l_children: like children
		do
			l_children := children
			if l_children = Void then
				create l_children.make_with_capacity (50)
				children := l_children
			end
			l_children.put_last (a_document_symbol)
		end

feature -- Field names

	name_name: STRING_8 = "name"
	detail_name: STRING_8 = "detail"
	kind_name: STRING_8 = "kind"
	tags_name: STRING_8 = "tags"
	deprecated_name: STRING_8 = "deprecated"
	range_name: STRING_8 = "range"
	selection_range_name: STRING_8 = "selectionRange"
	children_name: STRING_8 = "children"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol (Current)
		end

invariant

	name_not_void: name /= Void
	kind_not_void: kind /= Void
	range_not_void: range /= Void
	selection_range_not_void: selection_range /= Void

end
