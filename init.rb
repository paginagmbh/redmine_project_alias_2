require 'redmine'
require 'dispatcher'

RAILS_DEFAULT_LOGGER.info 'Starting Project Alias plugin for Redmine'

# TODO: Let rename project (change default identifier)
# TODO: perhaps also use rev=canonical

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
end
