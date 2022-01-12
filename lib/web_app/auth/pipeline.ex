defmodule WebApp.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :web_app,
    error_handler: WebApp.Auth.ErrorHandler,
    module: WebApp.Auth.Guardian

    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}


    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}


    plug Guardian.Plug.LoadResource, allow_blank: true
end
