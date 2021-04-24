# MnesiaCrud


Step: 1

```
mix deps.get
```

Step: 2

```
mix test --trace
```

To run as standalone you required to initialize mnesia DB and table.

```
mix amnesia.create -d ThingDB --disk 
```

and then 

```
$  iex -S mix   
Erlang/OTP 23 [erts-11.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.11.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>  MnesiaCrud.Thing.create( "1", "aadi")
%ThingDB.Thing{id: "1", value: "aadi"}
iex(2)> MnesiaCrud.Thing.find( "1")
%ThingDB.Thing{id: "1", value: "aadi"}

```
