require 'redmine'

require_dependency 'project_alias_hook'

Rails.logger.info 'Starting Project Alias plugin for Redmine'

Rails.configuration.to_prepare do
    unless Project.included_modules.include?(AliasProjectPatch)
        Project.send(:include, AliasProjectPatch)
    end
    unless ApplicationHelper.included_modules.include?(AliasApplicationHelperPatch)
        ApplicationHelper.send(:include, AliasApplicationHelperPatch)
    end
end

Redmine::Plugin.register :project_alias do
    name 'Project Alias'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Allows adding project identifier aliases.'
    url 'http://projects.andriylesyuk.com/projects/redmine-alias'
    version '0.1.0'

    menu :admin_menu, :project_aliases,
                    { :controller => 'project_aliases', :action => 'index' },
                      :caption => :label_project_alias_plural,
                      :after => :projects
end
