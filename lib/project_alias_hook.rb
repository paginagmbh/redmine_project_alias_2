class ProjectAliasHook  < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context = {})
        stylesheet_link_tag('admin', :plugin => 'project_alias')
    end

end
