class AddCitextExtension < ActiveRecord::Migration[5.1]
  def change
    # https://mikecoutermarsh.com/storing-email-in-postgres-rails-use-citext/
    enable_extension 'citext'
  end
end
