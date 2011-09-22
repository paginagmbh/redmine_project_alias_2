class ProjectAliasesController < ApplicationController
    layout 'admin'

    before_filter :require_admin

    def index
        @aliases = ProjectAlias.all # FIXME: (:order => :alias)
    end

    def new
        @alias = ProjectAlias.new
        @projects = Project.find(:all)
    end

end
