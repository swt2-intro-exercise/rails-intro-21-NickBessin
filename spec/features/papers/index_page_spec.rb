require 'rails_helper'

describe "Index page", type: :feature do
  it "should render w/o an error" do
    visit papers_path
  end
end