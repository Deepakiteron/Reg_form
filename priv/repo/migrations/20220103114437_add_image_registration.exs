defmodule WebApp.Repo.Migrations.CreateRegistrations do
  use Ecto.Migration
  def change do
    alter table("registrations") do
    add :image, :string
    end
  end

end
