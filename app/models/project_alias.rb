class ProjectAlias < ActiveRecord::Base
    belongs_to :project

    validates_presence_of :project, :alias
    validates_uniqueness_of :alias
    validates_length_of :alias, :in => 1..Project::IDENTIFIER_MAX_LENGTH
    validates_format_of :alias, :with => /^(?!\d+$)[a-z0-9\-]*$/
    validates_exclusion_of :alias, :in => %w(new)

    def validate
        if self.alias == self.project.identifier
            errors.add(:alias, :same_as_identifier)
        elsif Project.find_all_by_identifier(self.alias).any?
            errors.add(:alias, :identifier_exists)
        end
    end

    def rename!
        if Project.connection.update("UPDATE #{Project.table_name} " +
                                     "SET identifier = '#{self.alias}' " +
                                     "WHERE id = #{project.id}") > 0
            if Project.connection.update("UPDATE #{ProjectAlias.table_name} " +
                                         "SET alias = '#{project.identifier}' " +
                                         "WHERE id = #{id}") > 0
                true
            else
                Project.connection.update("UPDATE #{Project.table_name} " +
                                          "SET identifier = '#{project.identifier}' " +
                                          "WHERE id = #{project.id}")
                false
            end
        else
            false
        end
    end

end
