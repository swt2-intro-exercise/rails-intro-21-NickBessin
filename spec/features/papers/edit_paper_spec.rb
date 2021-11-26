require 'rails_helper'

describe "Edit page", type: :feature do
	it "should allow to select paper authors from a multiple select box" do
		visit new_author_path
		fill_in 'author[first_name]', with: "Alan"
		fill_in 'author[last_name]', with: "Turing"
		submit_form

		visit new_paper_path
		expect(page.find(:select, 'paper[author_ids][]')[:multiple]).to be
	end
end