class DynaTablePage
	include PageObject	

	page_url "http://gwt.google.com/samples/DynaTable/DynaTable.html"
	button(:none, value: 'None')
	button(:close, value: 'Close')
	checkbox(:sunday, id: 'gwt-uid-1')
	checkbox(:monday, id: 'gwt-uid-2')
	checkbox(:tuesday, id: 'gwt-uid-3')
	checkbox(:wednesday, id: 'gwt-uid-4')
	checkbox(:thursday, id: 'gwt-uid-5')
	checkbox(:friday, id: 'gwt-uid-6')
	checkbox(:saturday, id: 'gwt-uid-7')
	table(:dyna_table, class: 'table')

	def select_schedule_for(day_of_week)
		none
		close
		self.send "check_#{day_of_week.downcase}"
	end


	def class_schedule_for(person)	
		schedule = nil
		wait_until(2) do
			schedule = dyna_table_element[person]['schedule'].text
		end
		schedule
	end
end
