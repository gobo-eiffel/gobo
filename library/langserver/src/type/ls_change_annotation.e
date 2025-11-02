note

	description:

		"LSP additional information that describes document changes"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CHANGE_ANNOTATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_label: like label; a_needs_confirmation: like needs_confirmation; a_description: like description)
			-- Create a new change annotation.
		require
			a_label_not_void: a_label /= Void
		do
			label := a_label
			needs_confirmation := a_needs_confirmation
			description := a_description
		ensure
			label_set: label = a_label
			needs_confirmation_set: needs_confirmation = a_needs_confirmation
			description_set: description = a_description
		end

feature -- Access

	label: LS_STRING
			-- A human-readable string describing the actual change. The string
			-- is rendered prominent in the user interface.

	needs_confirmation: detachable LS_BOOLEAN
			-- A flag which indicates that user confirmation is needed
			-- before applying the change.

	description: detachable LS_STRING
			-- A human-readable string which is rendered less prominent in
			-- the user interface.

feature -- Field names

	label_name: STRING_8 = "label"
	needs_confirmation_name: STRING_8 = "needsConfirmation"
	description_name: STRING_8 = "description"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_change_annotation (Current)
		end

invariant

	label_not_void: label /= Void
	
end
