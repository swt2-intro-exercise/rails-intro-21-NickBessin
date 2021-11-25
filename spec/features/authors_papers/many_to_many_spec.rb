require 'rails_helper'

describe "Paper model", type: :feature do
    it "should have and belong to many authors" do
        @paper = Paper.create(title: "Test", venue: "Station", year: 1955)
		expect(@paper.authors.empty?).to be
    end

    it "should save changes to the author list" do
        @alan = FactoryBot.create(:author)
        # Given a paper with one author
        @paper = FactoryBot.create(:paper, authors: [@alan])
        # And another author called 'Peter Plagiarist'
        @peter = FactoryBot.create(:author, first_name: 'Peter', last_name: 'Plagiarist', homepage: '')
        # When a user visits the paper's edit page
        visit edit_paper_path(@paper)
        # And then selects 'Peter Plagiarist' as author
        find(:css, 'select').find(:css, "option[value='#{@peter.id}']").select_option
        # And submits the form
        find(:css, 'input[type="submit"]').click

        # Reload object from database as it has been modified
        # by submitting the form
        @paper.reload
        # Then 'Peter Plagiarist' and 'Alan turing' should be authors of the paper
        expect(@paper.authors.count).to eq(2)
        expect(@paper.authors).to contain_exactly(@alan, @peter)
    end
end