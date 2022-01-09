class AddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    remove_column :comments, :comment_id
  end
end
