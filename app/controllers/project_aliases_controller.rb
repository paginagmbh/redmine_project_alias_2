class ProjectAliasesController < ApplicationController
    layout 'admin'

    before_filter :require_admin

    def index
        @aliases = ProjectAlias.all # FIXME: (:order => :alias)
    end

end
