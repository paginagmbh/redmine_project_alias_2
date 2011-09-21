class CreateProjectAliases < ActiveRecord::Migration

    def self.up
        create_table :project_aliases do |t|
            t.column :identifier, :string
            t.column :alias,      :string
        end
        add_index :project_aliases, [ :alias ], :unique => true, :name => :project_alias
    end

    def self.down
        drop_table :project_aliases
    end

end
