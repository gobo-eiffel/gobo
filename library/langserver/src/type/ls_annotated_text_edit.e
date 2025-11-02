note

	description:
	"[
		LSP special text edit with an additional change annotation.

		Support for AnnotatedTextEdit is guarded by the client
		capability 'workspace.workspaceEdit.changeAnnotationSupport'.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_ANNOTATED_TEXT_EDIT

inherit

	LS_TEXT_EDIT
		rename
			make as make_text_edit
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_range: like range; a_new_text: like new_text; a_annotation_id: like annotation_id)
			-- Create a new text edit.
		require
			a_range_not_void: a_range /= Void
			a_new_text_not_void: a_new_text /= Void
			a_annotation_id_not_void: a_annotation_id /= Void
		do
			range := a_range
			new_text := a_new_text
			annotation_id := a_annotation_id
		ensure
			range_set: range = a_range
			new_text_set: new_text = a_new_text
			annotation_id_set: annotation_id = a_annotation_id
		end

feature -- Access

	annotation_id: LS_CHANGE_ANNOTATION_IDENTIFIER
				-- The actual annotation identifier.

feature -- Field names

	annotation_id_name: STRING_8 = "annotationId"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_annotated_text_edit (Current)
		end

invariant

	annotation_id_not_void: annotation_id /= Void

end
