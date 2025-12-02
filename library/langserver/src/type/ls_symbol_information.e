note

	description:
	"[
		LSP symbol information.

		Represent information about programming constructs like variables, classes,
		interfaces etc.

		Deprecated: use LS_DOCUMENT_SYMBOL or LS_WORKSPACE_SYMBOL instead.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_INFORMATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_kind: like kind; a_tags: like tags;
		a_deprecated: like deprecated; a_location: like location;
		a_container_name: like container_name)
			-- Create a new symbol information.
		require
			a_name_not_void: a_name /= Void
			a_kind_not_void: a_kind /= Void
			a_location_not_void: a_location /= Void
		do
			name := a_name
			kind := a_kind
			tags := a_tags
			deprecated := a_deprecated
			location := a_location
			container_name := a_container_name
		ensure
			name_set: name = a_name
			kind_set: kind = a_kind
			tags_set: tags = a_tags
			deprecated_set: deprecated = a_deprecated
			location_set: location = a_location
			container_name_set: container_name = a_container_name
		end

feature -- Access

	name: LS_STRING
			-- The name of this symbol.

	kind: LS_SYMBOL_KIND
			-- The kind of this symbol.

	tags: detachable LS_SYMBOL_TAG_LIST
			-- Tags for this symbol.

	deprecated: detachable LS_BOOLEAN
			-- Indicates if this symbol is deprecated.
			--
			-- Deprecated: Use tags instead

	location: LS_LOCATION
			-- The location of this symbol. The location's range is used by a tool
			-- to reveal the location in the editor. If the symbol is selected in the
			-- tool the range's start information is used to position the cursor. So
			-- the range usually spans more then the actual symbol's name and does
			-- normally include things like visibility modifiers.
			
			-- The range doesn't have to denote a node range in the sense of an abstract
			-- syntax tree. It can therefore not be used to re-construct a hierarchy of
			-- the symbols.

	container_name: detachable LS_STRING
			-- The name of the symbol containing this symbol. This information is for
			-- user interface purposes (e.g. to render a qualifier in the user interface
			-- if necessary). It can't be used to re-infer a hierarchy for the document
			-- symbols.

feature -- Field names

	name_name: STRING_8 = "name"
	kind_name: STRING_8 = "kind"
	tags_name: STRING_8 = "tags"
	deprecated_name: STRING_8 = "deprecated"
	location_name: STRING_8 = "location"
	container_name_name: STRING_8 = "containerName"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_information (Current)
		end

invariant

	name_not_void: name /= Void
	kind_not_void: kind /= Void
	location_not_void: location /= Void

end
