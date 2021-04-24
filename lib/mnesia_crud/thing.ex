defmodule MnesiaCrud.Thing do
  require Amnesia
  require Amnesia.Helper
  require Exquisite
  require ThingDB.Thing

  alias ThingDB.Thing

  def create(value) do
    id = UUID.uuid4()
    create(id, value)
  end

  def create(id, value) do
    find(id)
    |> case do
         %Thing{}  -> {:error, :alredy_exixts}
         {:error, :not_found} ->
           Amnesia.transaction do
             %Thing{id: id, value: value}
             |> Thing.write()
           end
       end
  end

  def find(id) do
    Amnesia.transaction do
      Thing.read(id)
    end
    |> case do
         %Thing{} = record -> record
         _ -> {:error, :not_found}
       end
  end
end