indexing

	description:

		"Gobo Eiffel Ant: build tool for Eiffel, based on the concepts of Jakarta Ant"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT
	inherit
		GEANT_SHARED_PROPERTIES
		GEANT_ELEMENT_NAMES
	
creation

	make
	
feature
	make is
		do
			!!project.make
			project.load
			launch_build
		end


	launch_build is
		local
			i		: INTEGER
			ii		: INTEGER

			target	: GEANT_ELEMENT
			task_el	: GEANT_ELEMENT

			task	: GEANT_TASK
		do
			from i := 1 until i > project.targets.count loop
				target := project.targets.item(i)
				if target.get_attributevalue_by_name(Attribute_name_name).is_equal(project.current_target_name) then

					print(project.current_target_name.out + ":%N")

					from ii := 1 until ii > target.children.count loop
						task_el := target.children.item(ii)
	
						------- task dispatching ------
						-- compile_se --
						if task_el.name.is_equal(Compile_se_task_name) then
							-- SmallEiffel compilation
							!GEANT_COMPILE_SE_TASK!task.load_from_element(task_el)

						-- exec --
						elseif task_el.name.is_equal(Exec_task_name) then
							!GEANT_EXEC_TASK!task.load_from_element(task_el)

						-- lcc --
						elseif task_el.name.is_equal(Lcc_task_name) then
							!GEANT_LCC_TASK!task.load_from_element(task_el)

						-- var --
						elseif task_el.name.is_equal(Var_task_name) then
							!GEANT_VAR_TASK!task.load_from_element(task_el)

						-- xace --
						elseif task_el.name.is_equal(Xace_task_name) then
							!GEANT_XACE_TASK!task.load_from_element(task_el)

						-- gelex --
						elseif task_el.name.is_equal(Gelex_task_name) then
							!GEANT_GELEX_TASK!task.load_from_element(task_el)

						-- geyacc --
						elseif task_el.name.is_equal(Geyacc_task_name) then
							!GEANT_GEYACC_TASK!task.load_from_element(task_el)

						-- gepp --
						elseif task_el.name.is_equal(Gepp_task_name) then
							!GEANT_GEPP_TASK!task.load_from_element(task_el)

						-- getest --
						elseif task_el.name.is_equal(Getest_task_name) then
							!GEANT_GETEST_TASK!task.load_from_element(task_el)


						-- DEFAULT --
						else
							task := void
						end

						------- task execution ------
						if task /= void then
							task.execute
						else
							print("WARNING: unknown task : " + task_el.name.out + "%N")
						end
	
		       			ii := ii + 1
					end
				end
		
	       		i := i + 1
			end

--		print("BUILD SUCCESSFUL")
		--!! handle not successful cases

		end

	current_target_name	: UC_STRING

	project	: GEANT_PROJECT


end
