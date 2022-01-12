defmodule WebApp.Repo.Migrations.CreateRegistrations do
  use Ecto.Migration

  def change do
    create table(:registrations) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password, :string
      add :phone_number, :string

      timestamps()
    end

    create unique_index(:registrations, [:email])

  end
end
