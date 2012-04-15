class AddProjectAliasesUndeletable < ActiveRecord::Migration

    def self.up
        add_column :project_aliases, :undeletable, :boolean, :default => false, :null => false
    end

    def self.down
        remove_column :project_aliases, :undeletable
    end

end
