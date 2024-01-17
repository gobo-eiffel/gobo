note

	description:

		"Eiffel type marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2023, Eric Bezault and others"
	license: "MIT License"

deferred class ET_TYPE_MARK

inherit

	ET_AST_NODE

feature -- Status report

	is_attachment_mark: BOOLEAN
			-- Is current type mark an attachment mark?
		do
			Result := is_attached_mark or is_detachable_mark
		ensure
			definition: Result = (is_attached_mark or is_detachable_mark)
		end

	is_explicit_attachment_mark: BOOLEAN
			-- Is current type mark an explicit attachment mark?
		do
			Result := is_attached or is_detachable or is_bang or is_question_mark
		ensure
			definition: Result = (is_attached or is_detachable or is_bang or is_question_mark)
			is_attachment_mark: Result implies is_attachment_mark
		end

	is_attached_mark: BOOLEAN
			-- Is current type mark an attached mark?
		do
			Result := is_attached or is_bang
		end

	is_detachable_mark: BOOLEAN
			-- Is current type mark a detachable mark?
		do
			Result := is_detachable or is_question_mark
		end

	is_attached: BOOLEAN
			-- Is current type mark the keyword 'attached'?
		do
			-- Result := False
		end

	is_detachable: BOOLEAN
			-- Is current type mark the keyword 'detachable'?
		do
			-- Result := False
		end

	is_question_mark: BOOLEAN
			-- Is current type mark the symbol '?'?
		do
			-- Result := False
		end

	is_bang: BOOLEAN
			-- Is current type mark the symbol '!'?
		do
			-- Result := False
		end

	is_separateness_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be separate or not?
		do
			Result := is_separate_mark or is_non_separate_mark
		ensure
			defintion: Result = (is_separate_mark or is_non_separate_mark)
		end

	is_explicit_separateness_mark: BOOLEAN
			-- Is current type mark an explicit mark to indicate whether
			-- the type should be separate or not?
		do
			Result := is_separate
		ensure
			defintion: Result = is_separate
			is_separateness_mark: Result implies is_separateness_mark
		end

	is_separate_mark: BOOLEAN
			-- Is current type mark a mark to indicate that
			-- the type should be separate?
		do
			Result := is_separate
		end

	is_non_separate_mark: BOOLEAN
			-- Is current type mark a mark to indicate that
			-- the type should be non-separate?
		do
			-- Result := False
		end

	is_separate: BOOLEAN
			-- Is current type mark the keyword 'separate'?
		do
			-- Result := False
		end

	is_expandedness_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be expanded or reference?
		do
			Result := is_expanded_mark or is_reference_mark
		ensure
			defintion: Result = (is_expanded_mark or is_reference_mark)
		end

	is_explicit_expandedness_mark: BOOLEAN
			-- Is current type mark an explicit mark to indicate whether
			-- the type should be expanded or reference?
		do
			Result := is_expanded or is_reference
		ensure
			defintion: Result = (is_expanded or is_reference)
			is_expandedness_mark: Result implies is_expandedness_mark
		end

	is_expanded_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be expanded?
		do
			Result := is_expanded
		end

	is_reference_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be reference?
		do
			Result := is_reference
		end

	is_expanded: BOOLEAN
			-- Is current type mark the keyword 'expanded'?
		do
			-- Result := False
		end

	is_reference: BOOLEAN
			-- Is current type mark the keyword 'reference'?
		do
			-- Result := False
		end

	is_implicit_mark: BOOLEAN
			-- Is current type mark implicit (i.e. has no explicit keyword or symbol)?
		do
			Result := not (is_explicit_expandedness_mark or is_explicit_separateness_mark or is_explicit_attachment_mark)
		ensure
			definition: Result = not (is_explicit_expandedness_mark or is_explicit_separateness_mark or is_explicit_attachment_mark)
		end

feature -- Access

	overridden_type_mark (a_override_type_mark: detachable ET_TYPE_MARK): ET_TYPE_MARK
			-- Version of current type mark overridden by `a_override_type_mark'
		local
			l_result_expanded_mark: BOOLEAN
			l_result_reference_mark: BOOLEAN
			l_result_separate_mark: BOOLEAN
			l_result_non_separate_mark: BOOLEAN
			l_result_attached_mark: BOOLEAN
			l_result_detachable_mark: BOOLEAN
			l_current_ok: BOOLEAN
			l_other_ok: BOOLEAN
		do
			if a_override_type_mark = Void then
				Result := Current
			else
				l_current_ok := True
				l_other_ok := True
				if a_override_type_mark.is_expandedness_mark then
					if a_override_type_mark.is_expanded_mark then
						l_result_expanded_mark := True
						if not is_expanded_mark then
							l_current_ok := False
						end
					else
						l_result_reference_mark := True
						if not is_reference_mark then
							l_current_ok := False
						end
					end
				elseif is_expandedness_mark then
					l_other_ok := False
					if is_expanded_mark then
						l_result_expanded_mark := True
					else
						l_result_reference_mark := True
					end
				end
				if a_override_type_mark.is_separateness_mark then
					if a_override_type_mark.is_separate_mark then
						l_result_separate_mark := True
						if not is_separate_mark then
							l_current_ok := False
						end
					else
						l_result_non_separate_mark := True
						if not is_non_separate_mark then
							l_current_ok := False
						end
					end

				elseif is_separateness_mark then
					l_other_ok := False
					if is_separate_mark then
						l_result_separate_mark := True
					else
						l_result_non_separate_mark := True
					end

				end
				if a_override_type_mark.is_attachment_mark then
					if a_override_type_mark.is_attached_mark then
						l_result_attached_mark := True
						if not is_attached_mark then
							l_current_ok := False
						end
					else
						l_result_detachable_mark := True
						if not is_detachable_mark then
							l_current_ok := False
						end
					end
				elseif is_attachment_mark then
					l_other_ok := False
					if is_attached_mark then
						l_result_attached_mark := True
					else
						l_result_detachable_mark := True
					end
				end
				if l_current_ok then
					Result := Current
				elseif l_other_ok then
					Result := a_override_type_mark
				else
					Result := tokens.implicit_type_mark (l_result_expanded_mark, l_result_reference_mark, l_result_separate_mark, l_result_non_separate_mark, l_result_attached_mark, l_result_detachable_mark)
				end
			end
		ensure
			overridden_type_mark_not_void: Result /= Void
		end

feature -- Output

	attachment_text: STRING
			-- Textual representation of the attachment mark.
			-- Empty if not an attachment mark.
			-- Implicit attachment mark is enclosed between brackets
			-- (e.g. "[attached]").
		do
			if is_attached_mark then
				if is_explicit_attachment_mark then
					Result := tokens.attached_keyword_name
				else
					Result := tokens.implicit_attached_type_mark_name
				end
			elseif is_detachable_mark then
				if is_explicit_attachment_mark then
					Result := tokens.detachable_keyword_name
				else
					Result := tokens.implicit_detachable_type_mark_name
				end
			else
				Result := tokens.no_type_mark_name
			end
		ensure
			attachment_text_not_void: Result /= Void
			attachment_text_not_empty: is_attachment_mark = not Result.is_empty
		end

	separateness_text: STRING
			-- Textual representation of the separateness mark.
			-- Empty if not a separateness mark.
			-- Implicit separateness mark is enclosed between brackets
			-- (e.g. "[separate]").
		do
			if is_separate_mark then
				if is_explicit_separateness_mark then
					Result := tokens.separate_keyword_name
				else
					Result := tokens.implicit_separate_type_mark_name
				end
			else
				Result := tokens.no_type_mark_name
			end
		ensure
			separateness_text_not_void: Result /= Void
			separateness_text_not_empty: is_separateness_mark = not Result.is_empty
		end

	expandedness_text: STRING
			-- Textual representation of the expandedness mark.
			-- Empty if not an expandedness mark.
			-- Implicit expandedness mark is enclosed between brackets
			-- (e.g. "[expanded]").
		do
			if is_expanded_mark then
				if is_explicit_expandedness_mark then
					Result := tokens.expanded_keyword_name
				else
					Result := tokens.implicit_expanded_type_mark_name
				end
			elseif is_reference_mark then
				if is_explicit_expandedness_mark then
					Result := tokens.reference_keyword_name
				else
					Result := tokens.implicit_reference_type_mark_name
				end
			else
				Result := tokens.no_type_mark_name
			end
		ensure
			expandedness_text_not_void: Result /= Void
			expandedness_text_not_empty: is_expandedness_mark = not Result.is_empty
		end

	append_to_string_with_space (a_string: STRING)
			-- Append textual representation of
			-- current type mark to `a_string',
			-- followed by a space.
		require
			a_string_not_void: a_string /= Void
		local
			l_mark_text: STRING
		do
			l_mark_text := attachment_text
			if not l_mark_text.is_empty then
				a_string.append_string (l_mark_text)
				a_string.append_character (' ')
			end
			l_mark_text := separateness_text
			if not l_mark_text.is_empty then
				a_string.append_string (l_mark_text)
				a_string.append_character (' ')
			end
			l_mark_text := expandedness_text
			if not l_mark_text.is_empty then
				a_string.append_string (l_mark_text)
				a_string.append_character (' ')
			end
		end

invariant

	expandedness_consistency: not (is_expanded_mark and is_reference_mark)
	attachment_consistency: not (is_attached_mark and is_detachable_mark)
	separateness_consistency: not (is_separate_mark and is_non_separate_mark)

end
