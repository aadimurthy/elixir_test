use Amnesia

defdatabase ThingDB do
  deftable(
    Thing,
    [:id, :value],
    type: :set
  )
end
