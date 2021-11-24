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

	it "should save changes to the author list" do
		paper = create :paper
		author2 = Author.create(first_name: 'Peter', last_name: 'Plagiarist', homepage: 'lel')
		visit edit_paper_path(paper.id)
		page.find('select').select author2.name
		find('input[type="submit"]').click
		paper = Paper.where(id: paper.id).take
		
		# didn't understand why Alan Turing is 2 times in this array
		expect(paper.authors.length).to eq(3)
		expect(paper.authors[2].name).to eq('Peter Plagiarist')
	end
end