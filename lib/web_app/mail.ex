defmodule WebApp.Mail do
  import Swoosh.Email

  def welcome(registration) do
    new()
    |> to({registration.name, registration.email})
    |> from({"Deepak", "deepak.k@Iteron.com"})
    |> subject("Registration confirmation mail !!")
    |> html_body("<h1>Hello #{registration.name}</h1>")
    |> text_body("Hello #{registration.name}\n")
  end
end
