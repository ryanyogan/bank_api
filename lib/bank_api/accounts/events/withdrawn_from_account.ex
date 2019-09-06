defmodule BankAPI.Accounts.Events.WithdrawnFromAccount do
  @derive [Jason.Encoder]

  defstruct [
    :transfer_uuid,
    :account_uuid,
    :new_current_balance
  ]
end
