defmodule WebApp.Auth do

  alias Comeonin.Bcrypt
  alias WebApp.Registrations.Registration
  alias WebApp.Repo
  import Ecto.Query, only: [from: 2]


  def authenticate_user(email, plain_text_password) do
    query = from u in Registration, where: u.email == ^email
    Repo.one(query)
    |> check_password(plain_text_password)
    # |> IO.inspect(label: "user")
  end
  defp check_password(nil, _), do: {:error, "Incorrect username or password"}
  defp check_password(registration, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, registration.password) do
      true -> {:ok, registration}
      false -> {:error, "Incorrect username or password"}
    end
  end
end
