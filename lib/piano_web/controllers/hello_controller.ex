defmodule PianoWeb.HelloController do
  use PianoWeb, :controller

  alias Piano.Catalog
  alias Piano.Catalog.Hello

  def index(conn, _params) do
    hellos = Catalog.list_hellos()
    render(conn, "index.html", hellos: hellos)
  end

  def new(conn, _params) do
    changeset = Catalog.change_hello(%Hello{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hello" => hello_params}) do
    case Catalog.create_hello(hello_params) do
      {:ok, hello} ->
        conn
        |> put_flash(:info, "Hello created successfully.")
        |> redirect(to: Routes.hello_path(conn, :show, hello))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hello = Catalog.get_hello!(id)
    render(conn, "show.html", hello: hello)
  end

  def edit(conn, %{"id" => id}) do
    hello = Catalog.get_hello!(id)
    changeset = Catalog.change_hello(hello)
    render(conn, "edit.html", hello: hello, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hello" => hello_params}) do
    hello = Catalog.get_hello!(id)

    case Catalog.update_hello(hello, hello_params) do
      {:ok, hello} ->
        conn
        |> put_flash(:info, "Hello updated successfully.")
        |> redirect(to: Routes.hello_path(conn, :show, hello))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hello: hello, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hello = Catalog.get_hello!(id)
    {:ok, _hello} = Catalog.delete_hello(hello)

    conn
    |> put_flash(:info, "Hello deleted successfully.")
    |> redirect(to: Routes.hello_path(conn, :index))
  end
end
