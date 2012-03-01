class CreateTweetOptions < ActiveRecord::Migration
  def change
    create_table :tweet_options do |t|
      t.string :name
      t.string :format
      t.integer :account_id
      t.timestamps
    end
  end
end
