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
