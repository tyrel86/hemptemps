# This migration comes from refinery_contact_types (originally 1)
class CreateContactTypesContactTypes < ActiveRecord::Migration

  def up
    create_table :refinery_contact_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contact_types"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contact_types/contact_types"})
    end

    drop_table :refinery_contact_types

  end

end
