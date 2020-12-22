class CreateSlackUserTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :slack_user_tokens do |t|
      t.string :user_id
      t.string :access_token

      t.timestamps
    end
  end
end
