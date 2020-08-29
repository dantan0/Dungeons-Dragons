class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    has_many :spellclasses

    validates_presence_of :name, :level, :school, :description

    def self.order_by
        return Spell.order(:level, :name)
    end

     def self.school_select
         schools = []
         schools << ""
         Spell.order(:school).each do |spell|
             if schools.include?(spell.school) == false
                 schools << spell.school
             end
         end
         return schools
     end
    #accepts_nested_attributes_for :spellclasses
end
