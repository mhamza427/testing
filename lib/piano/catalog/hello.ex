defmodule Piano.Catalog.Hello do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hellos" do
    field :description, :string
    field :price, :decimal
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(hello, attrs) do
    hello
    |> cast(attrs, [:title, :description, :price, :views])
    |> validate_required([:title, :description, :price, :views])
  end
end
