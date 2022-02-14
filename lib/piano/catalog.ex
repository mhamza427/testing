defmodule Piano.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Piano.Repo

  alias Piano.Catalog.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias Piano.Catalog.Hello

  @doc """
  Returns the list of hellos.

  ## Examples

      iex> list_hellos()
      [%Hello{}, ...]

  """
  def list_hellos do
    Repo.all(Hello)
  end

  @doc """
  Gets a single hello.

  Raises `Ecto.NoResultsError` if the Hello does not exist.

  ## Examples

      iex> get_hello!(123)
      %Hello{}

      iex> get_hello!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hello!(id), do: Repo.get!(Hello, id)

  @doc """
  Creates a hello.

  ## Examples

      iex> create_hello(%{field: value})
      {:ok, %Hello{}}

      iex> create_hello(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hello(attrs \\ %{}) do
    %Hello{}
    |> Hello.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hello.

  ## Examples

      iex> update_hello(hello, %{field: new_value})
      {:ok, %Hello{}}

      iex> update_hello(hello, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hello(%Hello{} = hello, attrs) do
    hello
    |> Hello.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hello.

  ## Examples

      iex> delete_hello(hello)
      {:ok, %Hello{}}

      iex> delete_hello(hello)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hello(%Hello{} = hello) do
    Repo.delete(hello)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hello changes.

  ## Examples

      iex> change_hello(hello)
      %Ecto.Changeset{data: %Hello{}}

  """
  def change_hello(%Hello{} = hello, attrs \\ %{}) do
    Hello.changeset(hello, attrs)
  end
end
