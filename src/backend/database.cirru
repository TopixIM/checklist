
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline
  schema $ require :./schema
  shortid $ require :shortid
  fs $ require :fs
  path $ require :path
  itemController $ require :./controllers/item
  groupController $ require :./controllers/group
  stateController $ require :./controllers/state

= exports.in $ new Pipeline

var _database $ Immutable.fromJS schema.database

= exports.out $ exports.in.reduce _database $ \ (db action)
  case action.type
    :state/connect $ stateController.connect db action
    :state/disconnect $ stateController.disconnect db action

    :group/add $ groupController.add db action
    :group/update $ groupController.update db action
    :group/toggle $ groupController.toggle db action

    :item/add $ itemController.add db action
    :item/update $ itemController.update db action
    :item/toggle $ itemController.toggle db action

    else db
