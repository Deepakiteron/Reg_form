defmodule WebAppWeb.SessionController do
  use WebAppWeb, :controller

  alias WebApp.Auth
  alias WebApp.Registrations
  alias WebApp.Registrations.Registration
  alias WebApp.Auth.Guardian

  def index(conn, _params) do
    changeset = Registrations.change_registration(%Registration{})
    maybe_user = Guardian.Plug.current_resource(conn)
    message = if maybe_user != nil do
      "Someone is logged in"
    else
      "No one is logged in"
    end
    conn
      |> put_flash(:info, message)
      |> render("index.html", changeset: changeset, action: Routes.session_path(conn, :login))
  end
  def login(conn, %{"registration" => %{"email" => email, "password" => password}}) do
    Auth.authenticate_user(email, password)
    |> login_reply(conn)
  end
  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/")
  end
  defp login_reply({:ok, registration}, conn) do
    conn
     |> put_flash(:success, "Welcome back!")
     |> Guardian.Plug.sign_in(registration)
     |> render("secret.html")
  end
  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: Routes.page_path(conn, :index))
  end
  def secret(conn, _params) do
    render(conn, "secret.html")
  end
end
