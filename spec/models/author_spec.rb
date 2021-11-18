require 'rails_helper'

RSpec.describe "Author model", type: :model do
  it "should test the full model" do
    author = Author.new("Alan", "Turing")
    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.de/Alan_Turing")
    expect(author.name).to eq("Alan Turing")
  end
end
