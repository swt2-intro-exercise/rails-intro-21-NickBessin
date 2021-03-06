require 'rails_helper'

describe "New paper page", type: :feature do
  it "should not validate w/o title" do
    paper = Paper.new(title: nil, venue: "RKI", year: "2020")
    expect(paper).to_not be_valid
  end

  it "should not validate w/o venue" do
    paper = Paper.new(title: "Sport Bild", venue: nil, year: "2020")
    expect(paper).to_not be_valid
  end

  it "should not validate w/o year" do
    paper = Paper.new(title: "Sport Bild", venue: "Dresden", year: nil)
    expect(paper).to_not be_valid
  end

  it "should not validate w/ non-integer year" do
    paper = Paper.new(title: "Sport Bild", venue: "Dresden", year: "nineteen-fifty")
    expect(paper).to_not be_valid
  end
end