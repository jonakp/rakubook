# 読書履歴マスタの作成
class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.string :name,   comment: '書籍名'
      t.integer :price, comment: '価格'

      t.timestamps
    end
  end
end
