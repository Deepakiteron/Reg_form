defmodule WebApp.Auth.Guardian do
  use Guardian, otp_app: :web_app

  alias WebApp.Registrations

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    user = Registrations.get_registration!(id)
    {:ok, user}
  rescue
    Ecto.NoResultsError -> {:error, :resource_not_found}
  end
end
