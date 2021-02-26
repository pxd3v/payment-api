defmodule Rocketpay.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.Users.Create
  alias Rocketpay.User

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Pedro",
        password: "123456",
        nickname: "Lages",
        email: "pedro@mail.com",
        age: 21
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)
      assert %User{name: "Pedro", age: 21, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Pedro",
        nickname: "Lages",
        email: "pedro@mail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}
      assert expected_response == errors_on(changeset)
    end
  end
end
