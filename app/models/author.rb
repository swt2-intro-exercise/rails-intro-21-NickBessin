class Author < ApplicationRecord
	has_and_belongs_to_many :papers
    validates :last_name, presence: true
    
    def new(first_name, last_name, homepage)
        self.first_name = first_name
        self.last_name = last_name
        self.homepage = homepage
    end

    def name
        return self.first_name + " " + self.last_name
    end
end
