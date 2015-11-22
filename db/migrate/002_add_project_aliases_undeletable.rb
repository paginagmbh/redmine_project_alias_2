class AddProjectAliasesUndeletable < ActiveRecord::Migration

    def self.up
        unless column_exists? :project_aliases, :undeletable
            add_column :project_aliases, :undeletable, :boolean, :default => false, :null => false
        end
    end

    def self.down
        remove_column :project_aliases, :undeletable
    end

end
