
var
  Immutable $ require :immutable

= exports.database $ Immutable.fromJS $ {}
  :groups $ []
  :states $ {}

= exports.group $ Immutable.fromJS $ {}
  :id null
  :text :
  :textTime null
  :children $ []

= exports.item $ Immutable.fromJS $ {}
  :id null
  :groupId null
  :text :
  :textTime null
  :done false

= exports.store $ Immutable.fromJS $ {}
  :groups $ []

= exports.state $ Immutable.fromJS $ {}
  :name :
