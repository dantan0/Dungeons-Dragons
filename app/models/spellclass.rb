class Spellclass < ApplicationRecord
    belongs_to :spell
    
    def self.select_all
        classes = []
        Spellclass.order(:spellclasses).each do |c|
            if classes.include?(c) == false
                classes << c
            end
        end
        return classes
    end
end
