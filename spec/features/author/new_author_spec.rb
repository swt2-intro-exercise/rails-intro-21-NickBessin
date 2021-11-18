require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text input fields for an author's first name, last name, and homepage" do
    visit new_author_path
    expect(page).to have_field 'author[first_name]'
    expect(page).to have_field 'author[last_name]'
    expect(page).to have_field 'author[homepage]'
  end

  it "should not validate w/o last name" do
    author = Author.new(first_name: "Mario", last_name: "", homepage: "Party")
    expect(author).to_not be_valid
  end
end
