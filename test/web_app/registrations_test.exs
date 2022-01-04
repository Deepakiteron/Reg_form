defmodule WebApp.RegistrationsTest do
  use WebApp.DataCase

  alias WebApp.Registrations

  describe "registrations" do
    alias WebApp.Registrations.Registration

    import WebApp.RegistrationsFixtures

    @invalid_attrs %{age: nil, email: nil, name: nil, password: nil, phone_number: nil}

    test "list_registrations/0 returns all registrations" do
      registration = registration_fixture()
      assert Registrations.list_registrations() == [registration]
    end

    test "get_registration!/1 returns the registration with given id" do
      registration = registration_fixture()
      assert Registrations.get_registration!(registration.id) == registration
    end

    test "create_registration/1 with valid data creates a registration" do
      valid_attrs = %{age: 42, email: "some email", name: "some name", password: "some password", phone_number: "some phone_number"}

      assert {:ok, %Registration{} = registration} = Registrations.create_registration(valid_attrs)
      assert registration.age == 42
      assert registration.email == "some email"
      assert registration.name == "some name"
      assert registration.password == "some password"
      assert registration.phone_number == "some phone_number"
    end

    test "create_registration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registrations.create_registration(@invalid_attrs)
    end

    test "update_registration/2 with valid data updates the registration" do
      registration = registration_fixture()
      update_attrs = %{age: 43, email: "some updated email", name: "some updated name", password: "some updated password", phone_number: "some updated phone_number"}

      assert {:ok, %Registration{} = registration} = Registrations.update_registration(registration, update_attrs)
      assert registration.age == 43
      assert registration.email == "some updated email"
      assert registration.name == "some updated name"
      assert registration.password == "some updated password"
      assert registration.phone_number == "some updated phone_number"
    end

    test "update_registration/2 with invalid data returns error changeset" do
      registration = registration_fixture()
      assert {:error, %Ecto.Changeset{}} = Registrations.update_registration(registration, @invalid_attrs)
      assert registration == Registrations.get_registration!(registration.id)
    end

    test "delete_registration/1 deletes the registration" do
      registration = registration_fixture()
      assert {:ok, %Registration{}} = Registrations.delete_registration(registration)
      assert_raise Ecto.NoResultsError, fn -> Registrations.get_registration!(registration.id) end
    end

    test "change_registration/1 returns a registration changeset" do
      registration = registration_fixture()
      assert %Ecto.Changeset{} = Registrations.change_registration(registration)
    end
  end
end
