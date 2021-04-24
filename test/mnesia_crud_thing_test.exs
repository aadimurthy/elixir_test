defmodule MnesiaCrudThingTest do
  use ExUnit.Case

  test "should store a record with given id and value and able to fetch it using id" do
    MnesiaCrud.Thing.create( "test-id-1", "test-value-1")
    assert MnesiaCrud.Thing.find( "test-id-1") ==   %ThingDB.Thing{id: "test-id-1", value: "test-value-1"}
  end

  test "should create a record with given value and auto generate id and store it" do
    record = MnesiaCrud.Thing.create("test-value-2")
    assert MnesiaCrud.Thing.find( record.id) == %ThingDB.Thing{id: record.id, value: "test-value-2"}
  end


  test "should return a error when record already exists" do
    exitingRecord = MnesiaCrud.Thing.create("test-value-3")
    assert MnesiaCrud.Thing.create(exitingRecord.id, "test-value") == {:error, :alredy_exixts}
  end

  test "should return matching record with given id" do
    [{"id1", "record1"}, {"id2", "record2"}, {"id3", "record3"}]
    |>Enum.each(fn {id,value} -> MnesiaCrud.Thing.create(id, value) end)
    assert MnesiaCrud.Thing.find( "id2") ==     %ThingDB.Thing{id: "id2", value: "record2"}
  end

  test "should return an error when record not found" do
    assert MnesiaCrud.Thing.find( "non_existent") ==   {:error, :not_found}
  end

  setup_all do
      ThingDB.destroy
      ThingDB.create!

    on_exit fn ->
      ThingDB.destroy
    end
  end

end
