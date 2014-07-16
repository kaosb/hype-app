class CreateProfiles < ActiveRecord::Migration
	def change
		create_table :profiles do |t|
			t.string :name
			t.string :lastname
			t.string :nickname
			t.string :twitter_profile
			t.string :facebook_profile
			t.string :instagram_profile
			t.integer :user_id
			t.timestamps
		end
	end
end
