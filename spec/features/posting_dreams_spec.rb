require "rails_helper"

RSpec.feature "Users can post dreams" do 
	scenario "with valid attributes" do
		visit "/"

		click_link "Record Dream"

		fill_in "Dream Name", with: "My Latest Dream"
		fill_in "Your Dream", with: "Rihanna and Beyonce giving me a sponge bath"
		click_button "Create Dream"

		expect(page).to have_content "Dream created."
	end
end

RSpec.feature "Users can edit dreams" do
	scenario "with valid attributes" do
		visit "/"

		click_link "Record Dream"

		fill_in "Dream Name", with: "Nightmare"
		fill_in "Your Dream", with: "Clowns everywhere!"

		click_button "Create Dream"

		expect(page).to have_content "Clowns everywhere!"
		
		click_link "Update"
		fill_in "Your Dream", with: "20 foot clowns everywhere!"

		click_button "Update Dream"
		
		expect(page).to have_content "Dream updated."
		expect(page).to have_content "20 foot clowns everywhere!"
	end
end


RSpec.feature "Users can view dreams" do
	scenario "with valid attributes" do
		visit "/"

		click_link "Record Dream"

		fill_in "Dream Name", with: "Last Night's Ghost Dream"
		fill_in "Your Dream", with: "woooooo, spooky"

		click_button "Create Dream"

		expect(page).to have_content "Last Night's Ghost Dream"
		expect(page).to have_content "woooooo, spooky"
	end
end

RSpec.feature "Users can delete dreams" do
	scenario "successfully" do
		visit "/"

		click_link "Record Dream"

		fill_in "Dream Name", with: "Nightmare"
		fill_in "Your Dream", with: "Clowns everywhere!"

		click_button "Create Dream"

		expect(page).to have_content "Clowns everywhere!"
		
		click_link "Forget"
		
		expect(page).to have_content "Dream forgotten."
		expect(page.current_url).to eq dreams_url
		expect(page).to have_no_content "Clowns everywhere!"
	end
end
