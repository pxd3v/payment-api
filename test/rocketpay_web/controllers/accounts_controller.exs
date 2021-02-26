defmodule Rocketpay.AccountsControllerTest do
  use RocketpayWeb.ConnCase

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Pedro",
        nickname: "Lages",
        email: "pedro@mail.com",
        age: 15
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      {:ok, conn: conn, account_id: account_id}
    end
    
    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      
    end
  end
end
