require_dependency 'project'

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
                if project_alias
                    RAILS_DEFAULT_LOGGER.info "Using project identifier #{project_alias.identifier}"
                    args[0] = project_alias.identifier
                end
            end
            find_all_by_identifier(*args).first
        end

    end

end
