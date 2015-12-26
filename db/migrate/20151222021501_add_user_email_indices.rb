class AddUserEmailIndices < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  end

  def new
  	@user = User.new
  end
end
