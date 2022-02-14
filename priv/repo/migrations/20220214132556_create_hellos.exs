defmodule Piano.Repo.Migrations.CreateHellos do
  use Ecto.Migration

  def change do
    create table(:hellos) do
      add :title, :string
      add :description, :string
      add :price, :decimal
      add :views, :integer

      timestamps()
    end
  end
end
