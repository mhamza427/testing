defmodule PianoWeb.HelloControllerTest do
  use PianoWeb.ConnCase

  import Piano.CatalogFixtures

  @create_attrs %{description: "some description", price: "120.5", title: "some title", views: 42}
  @update_attrs %{description: "some updated description", price: "456.7", title: "some updated title", views: 43}
  @invalid_attrs %{description: nil, price: nil, title: nil, views: nil}

  describe "index" do
    test "lists all hellos", %{conn: conn} do
      conn = get(conn, Routes.hello_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Hellos"
    end
  end

  describe "new hello" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.hello_path(conn, :new))
      assert html_response(conn, 200) =~ "New Hello"
    end
  end

  describe "create hello" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hello_path(conn, :create), hello: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.hello_path(conn, :show, id)

      conn = get(conn, Routes.hello_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Hello"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hello_path(conn, :create), hello: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Hello"
    end
  end

  describe "edit hello" do
    setup [:create_hello]

    test "renders form for editing chosen hello", %{conn: conn, hello: hello} do
      conn = get(conn, Routes.hello_path(conn, :edit, hello))
      assert html_response(conn, 200) =~ "Edit Hello"
    end
  end

  describe "update hello" do
    setup [:create_hello]

    test "redirects when data is valid", %{conn: conn, hello: hello} do
      conn = put(conn, Routes.hello_path(conn, :update, hello), hello: @update_attrs)
      assert redirected_to(conn) == Routes.hello_path(conn, :show, hello)

      conn = get(conn, Routes.hello_path(conn, :show, hello))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, hello: hello} do
      conn = put(conn, Routes.hello_path(conn, :update, hello), hello: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Hello"
    end
  end

  describe "delete hello" do
    setup [:create_hello]

    test "deletes chosen hello", %{conn: conn, hello: hello} do
      conn = delete(conn, Routes.hello_path(conn, :delete, hello))
      assert redirected_to(conn) == Routes.hello_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.hello_path(conn, :show, hello))
      end
    end
  end

  defp create_hello(_) do
    hello = hello_fixture()
    %{hello: hello}
  end
end
