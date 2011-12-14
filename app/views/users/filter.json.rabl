object false
node :pagination do
  @pagination
end
node :filters do
  @filters
end
child(@users) do
  extends('users/user')
end
