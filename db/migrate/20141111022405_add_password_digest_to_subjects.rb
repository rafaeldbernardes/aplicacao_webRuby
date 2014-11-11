class AddPasswordDigestToSubjects < ActiveRecord::Migration
  def up
  	add_column "subjects", "password_digest", :string
  end

  def down
  	remove_column "subjects", "password_digest"
  end
end
