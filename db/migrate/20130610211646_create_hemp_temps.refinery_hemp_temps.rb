# This migration comes from refinery_hemp_temps (originally 1)
class CreateHempTemps < ActiveRecord::Migration

  def self.up
    create_table :refinery_hemp_temps do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.boolean :badged
      t.string :license_number
      t.date :exp_date
      t.string :job_type
      t.boolean :bud_tender_experience
      t.integer :bud_tender_years
      t.boolean :bud_tender_strains
      t.boolean :bud_tender_edibles
      t.boolean :bud_tender_extracts
      t.boolean :bud_tender_clones
      t.boolean :bud_tender_register
      t.boolean :bud_tender_ailments
      t.boolean :grower_experience
      t.integer :grower_years
      t.boolean :grower_fifty_pounds
      t.string :grower_hydro_orgainics
      t.string :grower_organics
      t.string :grower_lighting
      t.text :grower_enjoyment
      t.text :grower_nutrient_lines
      t.text :grower_methods
      t.text :grower_largest_grow_room
      t.text :grower_media
      t.boolean :grower_environmental_controll
      t.text :grower_environmental_brands
      t.boolean :reception_experience
      t.text :reception_software
      t.boolean :reception_badged
      t.text :reception_work_history
      t.boolean :trimmer_experience
      t.integer :trimmer_years
      t.integer :trimmer_grams_per_day

      t.timestamps
    end

    add_index :refinery_hemp_temps, :id

    if (seed = Rails.root.join('db', 'seeds', 'hemp_temps.rb')).exist?
      load(seed)
    end
  end

  def self.down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "hemp_temps"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/hemp_temps"})
    end

    drop_table :refinery_hemp_temps
  end

end
