require 'redmine'

require_dependency 'project_alias_hook'

Rails.logger.info 'Starting Project Alias 2 plugin for Redmine'

Rails.configuration.to_prepare do
  unless String.method_defined?(:html_safe)
    String.send(:include, AliasStringHTMLSafePatch)
  end
  unless Project.included_modules.include?(AliasProjectPatch)
    Project.send(:include, AliasProjectPatch)
  end
  unless ApplicationHelper.included_modules.include?(AliasApplicationHelperPatch)
    ApplicationHelper.send(:include, AliasApplicationHelperPatch)
  end
end

Redmine::Plugin.register :redmine_project_alias_2 do
  name 'Project Alias 2'
  author 'Andriy Lesyuk & Tobias Fischer'
  description 'Allows adding project identifier aliases or renaming of project identifiers.'
  url 'https://github.com/paginagmbh/redmine_project-alias-2'
  version '1.0.3'
  requires_redmine :version_or_higher => '2.6'

  menu :admin_menu, :project_aliases,
                  { :controller => 'project_aliases', :action => 'index' },
                    :caption => :label_alias_plural,
                    :after => :projects,
                    html: { class: 'icon icon-project_aliases' }
end
