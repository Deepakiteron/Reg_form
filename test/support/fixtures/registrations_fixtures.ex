defmodule WebApp.RegistrationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WebApp.Registrations` context.
  """

  @doc """
  Generate a registration.
  """
  def registration_fixture(attrs \\ %{}) do
    {:ok, registration} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        name: "some name",
        password: "some password",
        phone_number: "some phone_number"
      })
      |> WebApp.Registrations.create_registration()

    registration
  end
end
