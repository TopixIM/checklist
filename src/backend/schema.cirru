
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :groups $ []
  :states $ {}

= exports.group $ Immutable.fromJS $ {}
  :id null
  :text :
  :children $ []

= exports.item $ Immutable.fromJS $ {}
  :id null
  :groupId null
  :text :
  :done false

= exports.store $ Immutable.fromJS $ {}
  :groups $ []

= exports.state $ Immutable.fromJS $ {}
  :name :
