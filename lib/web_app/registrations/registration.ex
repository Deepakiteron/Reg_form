defmodule WebApp.Registrations.Registration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "registrations" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :image, :string
    field :password, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(registration, attrs) do
    registration
    |> cast(attrs, [:name, :age, :email, :password, :phone_number])
    |> validate_required([:name, :age, :email, :password, :phone_number])
  end
end
