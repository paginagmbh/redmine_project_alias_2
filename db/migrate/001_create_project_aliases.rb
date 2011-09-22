class CreateProjectAliases < ActiveRecord::Migration

    def self.up
        create_table :project_aliases do |t|
            t.column :project_id, :integer, :null => false
            t.column :alias,      :string,  :null => false
        end
        add_index :project_aliases, [ :alias ], :unique => true, :name => :project_alias
    end

    def self.down
        drop_table :project_aliases
    end

end
