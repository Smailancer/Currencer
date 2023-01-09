class ChangeValueType < ActiveRecord::Migration[7.0]
  def change
    change_column :currencies, :value, :float
  end
end
