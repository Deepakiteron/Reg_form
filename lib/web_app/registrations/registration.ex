defmodule WebApp.Registrations.Registration do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt
  alias WebApp.Registrations.Registration

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
  # def changeset(registration, attrs) do
  def changeset(%Registration{} = registration, attrs) do

    registration
    |> cast(attrs, [:name, :age, :email, :password, :phone_number])
    |> validate_required([:name, :age, :email, :password, :phone_number])
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset

end
