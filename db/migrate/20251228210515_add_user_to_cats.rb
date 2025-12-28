class AddUserToCats < ActiveRecord::Migration[8.0]
  def change
    add_reference :cats, :user, foreign_key: true
  end
end
