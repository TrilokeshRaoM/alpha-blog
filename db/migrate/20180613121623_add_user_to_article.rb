class AddUserToArticle < ActiveRecord::Migration[5.2]
  def change
    #When adding a new column see to that you mention the table name as it is in the database. i.e the table name in the case below is users
    add_column :articles, :user_id, :integer
  end
end
