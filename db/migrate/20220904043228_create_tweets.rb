class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
    t.string :title, null: false
    t.string :body, null: false
    t.integer :customer_id, null: false
    #管理者がユーザーの投稿を消せるように設定
    add_column :customers, :admin, :boolean, default: false
      t.timestamps
    end
  end
end
