require 'rails_helper'

describe "Paper model", type: :feature do
    it "should have and belong to many authors" do
        @paper = Paper.create(title: "Test", venue: "Station", year: 1955)
		expect(@paper.authors.empty?).to be
    end

end