class AddInputsToRefineryContactTypes < ActiveRecord::Migration
  def change
    add_column :refinery_contact_types, :inputs, :hstore
  end
end
