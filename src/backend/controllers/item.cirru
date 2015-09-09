
= exports.add $ \ (db action)
  db.update :groups $ \ (groups)
    groups.map $ \ (group)
      cond (is (group.get :id) (action.data.get :groupId))
        group.update :children $ \ (children)
          children.push action.data
        , group
