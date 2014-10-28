class ChangeAuthorIdInBooks < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute("ALTER TABLE books ALTER COLUMN author_id TYPE integer USING (author_id::integer);")
  end
end
