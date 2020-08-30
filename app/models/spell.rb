class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    has_many :spellclasses

    validates_presence_of :name, :level, :school, :description

    #scope :filter_by_level, -> (level) {where level: level}
    #scope :filter_by_school, -> (school) {where school: school}
    #scope :filter_by_concentration, -> (concentration) {where concentration: concentration}

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

    def self.all_levels
      spell_levels = []
      Spell.order(:level).each do |spell|
        if spell_levels.include?(spell.level) == false
          spell_levels << spell.level
        end
      end
      return spell_levels
    end

    def self.all_schools
      spell_schools = []
      Spell.order(:school).each do |spell|
        if spell_schools.include?(spell.school) == false
          spell_schools << spell.school
        end
      end
      return spell_schools
    end
    # accepts_nested_attributes_for :spellclasses
end
