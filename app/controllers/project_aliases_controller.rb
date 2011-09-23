class ProjectAliasesController < ApplicationController
    layout 'admin'

    before_filter :require_admin

    def index
        @aliases = ProjectAlias.find(:all) # FIXME: (:order => :alias)
        @projects = Project.visible.find(:all)
    end

    def new
        @alias = ProjectAlias.new
        @projects = Project.visible.find(:all, :order => 'lft')
    end

    def create
        @alias = ProjectAlias.new(params[:project_alias])
        if @alias.save
            flash[:notice] = l(:notice_successful_create)
            redirect_to(:action => 'index')
        else
            @projects = Project.find(:all, :order => 'lft')
            render('project_aliases/new')
        end
    end

    def destroy
        @alias = ProjectAlias.find(params[:id])
        if @alias.destroy
            flash[:notice] = l(:notice_successful_delete)
        end
        redirect_to(:action => 'index')
    end

    def rename
        @alias = ProjectAlias.find(params[:id])
        old_identifier = @alias.project.identifier
        new_identifier = @alias.alias
        if @alias.rename!
            flash[:notice] = l(:notice_successful_update)
            call_hook(:controller_project_aliases_rename_after,
                    { :project => @alias.project,
                      :old_identifier => old_identifier,
                      :new_identifier => new_identifier })
        end
        redirect_to(:action => 'index')
    end

end
