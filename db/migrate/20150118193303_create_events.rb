class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.datetime :moment
			t.string :name
			t.string :slug

			t.timestamps
		end
	end
end
