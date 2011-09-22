class ProjectAlias < ActiveRecord::Base
    belongs_to :project

    validates_presence_of :project, :alias
    validates_uniqueness_of :alias
end
