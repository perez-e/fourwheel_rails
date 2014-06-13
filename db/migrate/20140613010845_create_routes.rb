class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
