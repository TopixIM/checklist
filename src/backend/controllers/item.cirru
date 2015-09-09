
= exports.add $ \ (db action)
  db.update :groups $ \ (groups)
    groups.map $ \ (group)
      cond (is (group.get :id) (action.data.get :groupId))
        group.update :children $ \ (children)
          children.push action.data
        , group

= exports.update $ \ (db action)
  var
    groupId $ action.data.get :groupId
    text $ action.data.get :text
    itemId $ action.data.get :itemId
  db.update :groups $ \ (groups)
    groups.map $ \ (group)
      cond (is (group.get :id) groupId)
        group.update :children $ \ (children)
          children.map $ \ (item)
            cond (is (item.get :id) itemId)
              item.set :text text
              , item
        , group

= exports.toggle $ \ (db action)
  var
    groupId $ action.data.get :groupId
    itemId $ action.data.get :itemId
  db.update :groups $ \ (groups)
    groups.map $ \ (group)
      cond (is (group.get :id) groupId)
        group.update :children $ \ (children)
          children.map $ \ (item)
            cond (is (item.get :id) itemId)
              item.set :done $ not $ item.get :done
              , item
        , group
