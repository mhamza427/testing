defmodule Piano.CatalogTest do
  use Piano.DataCase

  alias Piano.Catalog

  describe "products" do
    alias Piano.Catalog.Product

    import Piano.CatalogFixtures

    @invalid_attrs %{description: nil, price: nil, title: nil, views: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{description: "some description", price: "120.5", title: "some title", views: 42}

      assert {:ok, %Product{} = product} = Catalog.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.price == Decimal.new("120.5")
      assert product.title == "some title"
      assert product.views == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{description: "some updated description", price: "456.7", title: "some updated title", views: 43}

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.price == Decimal.new("456.7")
      assert product.title == "some updated title"
      assert product.views == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "hellos" do
    alias Piano.Catalog.Hello

    import Piano.CatalogFixtures

    @invalid_attrs %{description: nil, price: nil, title: nil, views: nil}

    test "list_hellos/0 returns all hellos" do
      hello = hello_fixture()
      assert Catalog.list_hellos() == [hello]
    end

    test "get_hello!/1 returns the hello with given id" do
      hello = hello_fixture()
      assert Catalog.get_hello!(hello.id) == hello
    end

    test "create_hello/1 with valid data creates a hello" do
      valid_attrs = %{description: "some description", price: "120.5", title: "some title", views: 42}

      assert {:ok, %Hello{} = hello} = Catalog.create_hello(valid_attrs)
      assert hello.description == "some description"
      assert hello.price == Decimal.new("120.5")
      assert hello.title == "some title"
      assert hello.views == 42
    end

    test "create_hello/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_hello(@invalid_attrs)
    end

    test "update_hello/2 with valid data updates the hello" do
      hello = hello_fixture()
      update_attrs = %{description: "some updated description", price: "456.7", title: "some updated title", views: 43}

      assert {:ok, %Hello{} = hello} = Catalog.update_hello(hello, update_attrs)
      assert hello.description == "some updated description"
      assert hello.price == Decimal.new("456.7")
      assert hello.title == "some updated title"
      assert hello.views == 43
    end

    test "update_hello/2 with invalid data returns error changeset" do
      hello = hello_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_hello(hello, @invalid_attrs)
      assert hello == Catalog.get_hello!(hello.id)
    end

    test "delete_hello/1 deletes the hello" do
      hello = hello_fixture()
      assert {:ok, %Hello{}} = Catalog.delete_hello(hello)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_hello!(hello.id) end
    end

    test "change_hello/1 returns a hello changeset" do
      hello = hello_fixture()
      assert %Ecto.Changeset{} = Catalog.change_hello(hello)
    end
  end
end
