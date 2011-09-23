require_dependency 'project'

# TODO: do not allow creating projects with identifier available as alias

module AliasProjectPatch

    def self.included(base)
        base.extend(ClassMethods)
        base.class_eval do
            unloadable
            has_many :project_aliases, :dependent => :destroy
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

end
