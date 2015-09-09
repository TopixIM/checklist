
= exports.add $ \ (db action)
  db.update :groups $ \ (groups)
    groups.push action.data

= exports.remove $ \ (db action)
  db.delete action.data

= exports.update $ \ (db action)
  var
    groupId $ action.data.get :groupId
    text $ action.data.get :text
  db.update :groups $ \ (groups)
    groups.map $ \ (group)
      cond (is (group.get :id) groupId)
        group.set :text text
        , group

= exports.toggle $ \ (db action)
  return db
