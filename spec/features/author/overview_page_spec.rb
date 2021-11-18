require 'rails_helper'

describe "Overview page", type: :feature do
  it "should link to the new author page" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end
end
