class ProjectAliasesController < ApplicationController
    layout 'admin'

    before_filter :require_admin

    def index
        @aliases = ProjectAlias.find(:all) # FIXME: (:order => :alias)
        @projects = Project.find(:all) # FIXME: visible!
    end

    def new
        @alias = ProjectAlias.new
        @projects = Project.find(:all, :order => 'lft')
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

end
