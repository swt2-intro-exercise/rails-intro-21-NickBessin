require 'rails_helper'

describe "Edit page", type: :feature do
    it "should save changes w/o an error" do
        @author = Author.create(first_name: "Alan", last_name: "Turing", homepage: "")
        visit edit_author_path(@author)
        expect{ @author.update(first_name: "Ken") }.to_not raise_error
        expect{ @author.reload }.to_not raise_error
    end

end