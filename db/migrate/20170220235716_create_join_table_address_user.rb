class CreateJoinTableAddressUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :addresses, :users do |t|
      t.index [:address_id, :user_id]
    end
  end
end
