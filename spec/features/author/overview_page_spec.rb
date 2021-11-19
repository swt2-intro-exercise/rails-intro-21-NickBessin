require 'rails_helper'

describe "Overview page", type: :feature do
  it "should link to the new author page" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should have a link to delete an author" do
    @author = Author.create(first_name: 'Alan', last_name: 'Turing')
    puts @author.name
    visit authors_path
    expect(page).to have_link 'Delete'
  end
end
