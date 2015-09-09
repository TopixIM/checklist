
var
  shortid $ require :shortid
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

var
  schema $ require :./schema

= exports.in $ new Pipeline
= exports.out $ new Pipeline

var bind $ \ (v k) (k v)

exports.in.for $ \ (action)
  exports.out.send $ {}
    :type action.type
    :stateId action.stateId
    :data $ case action.type
      :group/add $ schema.group.set :id (shortid.generate)
      :item/add $ ... schema.item
        set :id (shortid.generate)
        set :groupId action.data.groupId
      else $ Immutable.fromJS action.data
