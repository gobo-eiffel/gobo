note

	description:

		"Count events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EVENT_COUNT_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_content
		end

create

	make_null,
	make_next

feature -- Count

	processing_instructions: INTEGER
			-- Number of PI events.

	comments: INTEGER
			-- Number of comment events.

	start_tags: INTEGER
			-- Number of start tag events.

	attributes: INTEGER
			-- Number of attribute events.

	end_tags: INTEGER
			-- Number of end tag events.
			-- (equal to start tags on well formed documents)

	contents: INTEGER
			-- Number of content events.

	events: INTEGER
			-- Total number of events.
		do
			Result := comments + processing_instructions + start_tags + attributes + end_tags + contents
		ensure
			definition: Result = (comments + processing_instructions + start_tags + attributes + end_tags + contents)
		end

feature -- Events

	on_start
			-- Reset counters.
		do
			processing_instructions := 0
			comments := 0
			start_tags := 0
			attributes := 0
			end_tags := 0
			contents := 0
			Precursor
		end

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Count and forward.
		do
			processing_instructions := processing_instructions + 1
			Precursor (a_name, a_content)
		end

	on_comment (a_content: STRING)
			-- Count and forward.
		do
			comments := comments + 1
			Precursor (a_content)
		end

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Count and forward.
		do
			start_tags := start_tags + 1
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Count and forward.
		do
			attributes := attributes + 1
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Count and forward.
		do
			end_tags := end_tags + 1
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_content (a_content: STRING)
			-- Count and forward.
		do
			contents := contents + 1
			Precursor (a_content)
		end

end
