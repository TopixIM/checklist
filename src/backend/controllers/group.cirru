
= exports.add $ \ (db action)
  db.update :groups $ \ (groups)
    groups.push action.data

