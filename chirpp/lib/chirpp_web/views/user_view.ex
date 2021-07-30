defmodule ChirppWeb.UserView do
    use ChirppWeb, :view
    alias Chirpp.User
  
    def first_name(%User{name: name}) do
      name |> String.split(" ") |> Enum.at(0)
    end
  
  end