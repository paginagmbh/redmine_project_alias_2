class ProjectAliasHook  < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context = {})
        tags = stylesheet_link_tag('admin', :plugin => 'project_alias')

        if context[:project]
            params = {}
            if context[:request].get?
                context[:request].params.each do |name, value|
                    params[name.to_sym] = value
                end
            else
                params[:controller] = context[:request].params['controller']
                params[:action]     = context[:request].params['action']
                params[:id]         = context[:request].params['id']         if context[:request].params['id']
                params[:project_id] = context[:request].params['project_id'] if context[:request].params['project_id']
            end
            if params[:project_id]
                if context[:project].aliases.include?(params[:project_id])
                    params[:project_id] = context[:project].identifier
                    tags += '<link rel="canonical" href="' + url_for(params) + '" />'
                end
            elsif params[:id]
                if context[:project].aliases.include?(params[:id])
                    params[:id] = context[:project].identifier
                    tags += '<link rel="canonical" href="' + url_for(params) + '" />'
                end
            end
        end

        tags
    end

end
