if Rails::VERSION::MAJOR < 3

    ActionController::Routing::Routes.draw do |map|
        map.connect('project_aliases', :controller => 'project_aliases', :action => 'index')
        map.connect('project_aliases/new', :controller => 'project_aliases', :action => 'new')
        map.connect('project_aliases/create', :controller => 'project_aliases', :action => 'create')
        map.connect('project_aliases/:id/destroy', :controller => 'project_aliases', :action => 'destroy')
        map.connect('project_aliases/:id/rename', :controller => 'project_aliases', :action => 'rename')
    end

else
    # TODO
end
