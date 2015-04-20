defmodule Plixir.TableControllerTest do
  use Plixir.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Listing tables"
  end

end
