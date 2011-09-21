class ProjectAlias < ActiveRecord::Base
    belongs_to :project

    validates_presence_of :identifier, :alias
    validates_uniqueness_of :alias
end
