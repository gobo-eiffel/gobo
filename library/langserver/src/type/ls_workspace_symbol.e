note

	description:
	"[
		LSP workspace symbols.

		A special workspace symbol that supports locations without a range.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL

inherit

	LS_RESPONSE_RESULT

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_kind: like kind; a_tags: like tags;
		a_container_name: like container_name; a_location: like location;
		a_data: like data)
			-- Create a new workspace symbol.
		require
			a_name_not_void: a_name /= Void
			a_kind_not_void: a_kind /= Void
			a_location_not_void: a_location /= Void
		do
			name := a_name
			kind := a_kind
			tags := a_tags
			container_name := a_container_name
			location := a_location
			data := a_data
		ensure
			name_set: name = a_name

			kind_set: kind = a_kind
			tags_set: tags = a_tags
			container_name_set: container_name = a_container_name
			location_set: location = a_location
			data_set: data = a_data
		end

feature -- Access

	name: LS_STRING
			-- The name of this symbol.

	kind: LS_SYMBOL_KIND
			-- The kind of this symbol.

	tags: detachable LS_SYMBOL_TAG_LIST
			-- Tags for this symbol.

	container_name: detachable LS_STRING
			-- The name of the symbol containing this symbol. This information is for
			-- user interface purposes (e.g. to render a qualifier in the user interface
			-- if necessary). It can't be used to re-infer a hierarchy for the document
			-- symbols.

	location: LS_OPTIONAL_RANGE_LOCATION
			-- The location of this symbol. Whether a server is allowed to
			-- return a location without a range depends on the client
			-- capability `workspace.symbol.resolveSupport`.

	data: detachable LS_ANY
			-- A data entry field that is preserved on a workspace symbol between a
			-- workspace symbol request and a workspace symbol resolve request.

feature -- Field names

	name_name: STRING_8 = "name"
	kind_name: STRING_8 = "kind"
	tags_name: STRING_8 = "tags"
	container_name_name: STRING_8 = "containerName"
	location_name: STRING_8 = "location"
	data_name: STRING_8 = "data"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_symbol (Current)
		end

invariant

	name_not_void: name /= Void
	kind_not_void: kind /= Void
	location_not_void: location /= Void

end
