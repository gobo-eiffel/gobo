note

	description:

		"Eiffel type marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_MARK

inherit

	ET_AST_NODE

feature -- Status report

	is_expandedness_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be expanded or reference?
		do
			Result := is_expanded_mark or is_reference_mark
		ensure
			defintion: Result = (is_expanded_mark or is_reference_mark)
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

	is_separateness_mark: BOOLEAN
			-- Is current type mark a mark to indicate whether
			-- the type should be separate or not?
		do
			Result := is_separate_mark
		end

	is_separate_mark: BOOLEAN
			-- Is current type mark a mark to indicate that
			-- the type should be separate?
		do
			Result := is_separate
		end

	is_attachment_mark: BOOLEAN
			-- Is current type mark an attachment mark?
		do
			Result := is_attached_mark or is_detachable_mark
		ensure
			definition: Result = (is_attached_mark or is_detachable_mark)
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

	is_implicit_mark: BOOLEAN
			-- Is current type mark implicit?
		do
			Result := False
		end

	is_attached: BOOLEAN
			-- Is current type mark 'attached'?
		do
			-- Result := False
		end

	is_detachable: BOOLEAN
			-- Is current type mark 'detachable'?
		do
			-- Result := False
		end

	is_expanded: BOOLEAN
			-- Is current type mark 'expanded'?
		do
			-- Result := False
		end

	is_reference: BOOLEAN
			-- Is current type mark 'reference'?
		do
			-- Result := False
		end

	is_separate: BOOLEAN
			-- Is current type mark 'separate'?
		do
			-- Result := False
		end

	is_question_mark: BOOLEAN
			-- Is current type mark '?'?
		do
			-- Result := False
		end

	is_bang: BOOLEAN
			-- Is current type mark '!'?
		do
			-- Result := False
		end

feature -- Access

	overridden_type_mark (a_override_type_mark: detachable ET_TYPE_MARK): ET_TYPE_MARK
			-- Version of current type mark overridden by `a_override_type_mark'
		local
			l_result_expanded_mark: BOOLEAN
			l_result_reference_mark: BOOLEAN
			l_result_separate_mark: BOOLEAN
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
					l_result_separate_mark := True
					if not is_separate_mark then
						l_current_ok := False
					end
				elseif is_separateness_mark then
					l_other_ok := False
					l_result_separate_mark := True
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
					Result := tokens.implicit_type_mark (l_result_expanded_mark, l_result_reference_mark, l_result_separate_mark, l_result_attached_mark, l_result_detachable_mark)
				end
			end
		ensure
			overridden_type_mark_not_void: Result /= Void
		end

	text: STRING
			-- Textual representation of type mark
		do
			if is_attached_mark then
				if is_separate_mark then
					if is_expanded_mark then
						Result := tokens.attached_separate_expanded_type_mark_name
					elseif is_reference_mark then
						Result := tokens.attached_separate_reference_type_mark_name
					else
						Result := tokens.attached_separate_type_mark_name
					end
				elseif is_expanded_mark then
					Result := tokens.attached_expanded_type_mark_name
				elseif is_reference_mark then
					Result := tokens.attached_reference_type_mark_name
				else
					Result := tokens.attached_keyword_name
				end
			elseif is_detachable_mark then
				if is_separate_mark then
					if is_expanded_mark then
						Result := tokens.detachable_separate_expanded_type_mark_name
					elseif is_reference_mark then
						Result := tokens.detachable_separate_reference_type_mark_name
					else
						Result := tokens.detachable_separate_type_mark_name
					end
				elseif is_expanded_mark then
					Result := tokens.detachable_expanded_type_mark_name
				elseif is_reference_mark then
					Result := tokens.detachable_reference_type_mark_name
				else
					Result := tokens.detachable_keyword_name
				end
			elseif is_separate_mark then
				if is_expanded_mark then
					Result := tokens.separate_expanded_type_mark_name
				elseif is_reference_mark then
					Result := tokens.separate_reference_type_mark_name
				else
					Result := tokens.separate_keyword_name
				end
			elseif is_expanded_mark then
				Result := tokens.expanded_keyword_name
			elseif is_reference_mark then
				Result := tokens.reference_keyword_name
			else
				Result := tokens.no_type_mark_name
			end
		ensure
			text_not_void: Result /= Void
			text_not_empty: not is_implicit_mark implies Result.count > 0
		end

	is_type_mark: BOOLEAN
			-- Is `Current' a type mark?
		do
			Result := is_implicit_mark or is_expandedness_mark or is_separateness_mark or is_attachment_mark
		end

invariant

	expandedness_consistency: not (is_expanded_mark and is_reference_mark)
	attachment_consistency: not (is_attached_mark and is_detachable_mark)
	explicit_consistency: is_type_mark implies (not is_implicit_mark implies (is_expandedness_mark or is_separateness_mark or is_attachment_mark))

end
