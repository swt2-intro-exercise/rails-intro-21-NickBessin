require 'rails_helper'

describe "New paper page", type: :feature do
  it "should not validate w/o title" do
    paper = Paper.new(title: "Covid 19-Pandemic", venue: "RKI", year: "2020")
    expect(paper).to_not be_valid
  end
end