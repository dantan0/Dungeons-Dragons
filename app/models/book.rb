class Book < ApplicationRecord
    has_and_belongs_to_many :spells
    
    validates_presence_of :name
    
    def self.select_books
        books_arr = []
        Book.order(:name).each do |b|
            if books_arr.include?(b.name) == false
                books_arr.push [b.name, b.id]
            end
        end
        return books_arr
    end
end
