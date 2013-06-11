class AlterJobTypesForEmployer < ActiveRecord::Migration
  def up
		change_table :refinery_employer_inquiries do |t|
			t.change :job_types, :string
		end
  end

  def down
  end
end
