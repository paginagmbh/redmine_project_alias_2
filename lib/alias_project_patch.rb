require_dependency 'project'

module AliasProjectPatch

    def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable
            has_many :project_aliases, :class_name => 'ProjectAlias', :dependent => :delete_all
            validate :validate_alias_availability
        end
    end

    module ClassMethods

        def find_by_identifier(*args)
            if args.first
                project_alias = ProjectAlias.find_by_alias(args.first)
                return project_alias.project if project_alias
            end
            find_all_by_identifier(*args).first
        end

    end

    module InstanceMethods

        def aliases
            @aliases ||= project_aliases.inject([]) do |array, object|
                array << object.alias
            end
        end

        def validate_alias_availability
            if ProjectAlias.find_by_alias(self.identifier)
                errors.add(:identifier, :taken)
            end
        end

    end

end
