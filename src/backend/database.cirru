
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline
  schema $ require :./schema
  shortid $ require :shortid
  fs $ require :fs
  path $ require :path
  groupController $ require :./controllers/group
  itemController $ require :./controllers/item

= exports.in $ new Pipeline

var _database $ Immutable.fromJS schema.database

= exports.out $ exports.in.reduce _database $ \ (db action)
  case action.type
    :group/add $ groupController.add db action
    :item/add $ itemController.add db action

    else db
