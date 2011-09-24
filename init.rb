require 'redmine'
require 'dispatcher'

require_dependency 'project_alias_hook'

RAILS_DEFAULT_LOGGER.info 'Starting Project Alias plugin for Redmine'

Dispatcher.to_prepare :project_alias_plugin do
    unless Project.included_modules.include?(AliasProjectPatch)
        Project.send(:include, AliasProjectPatch)
    end
end

Redmine::Plugin.register :project_alias_plugin do
    name 'Project Alias'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Allows adding project identifier aliases.'
    url 'http://projects.andriylesyuk.com/projects/redmine-alias'
    version '0.0.1'

    menu :admin_menu, :project_aliases,
                    { :controller => 'project_aliases', :action => 'index' },
                      :caption => :label_project_alias_plural,
                      :after => :projects
end
