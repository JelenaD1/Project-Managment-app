class AddGithubColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :github, :string
  end
end
