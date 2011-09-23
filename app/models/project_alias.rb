class ProjectAlias < ActiveRecord::Base
    belongs_to :project

    validates_presence_of :project, :alias
    validates_uniqueness_of :alias
    validates_length_of :alias, :in => 1..Project::IDENTIFIER_MAX_LENGTH
    validates_format_of :alias, :with => /^(?!\d+$)[a-z0-9\-]*$/
    validates_exclusion_of :alias, :in => %w(new)

    def validate
        errors.add(:same_as_identifier) if self.alias == self.project.identifier # FIXME
        errors.add(:identifier_exists)  if Project.find_all_by_identifier(self.alias).any? # FIXME
    end

end
