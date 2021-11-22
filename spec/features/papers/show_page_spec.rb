require 'rails_helper'

describe "Show page", type: :feature do
  it "should list the authors" do
	author = build(:author)
	visit new_author_path
    fill_in 'author[first_name]', with: author.first_name
    fill_in 'author[last_name]', with: author.last_name
	submit_form

    paper = build(:paper)
	visit new_paper_path
	fill_in 'paper[title]', with: paper.title
	fill_in 'paper[venue]', with: paper.venue
    fill_in 'paper[year]', with: paper.year
	check('Alan Turing')
	submit_form
	visit papers_path(paper)
	expect(page).to have_text 'Alan Turing'
  end
end