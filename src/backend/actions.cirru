
var
  shortid $ require :shortid
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable

var
  time $ require :../util/time
  schema $ require :./schema

= exports.in $ new Pipeline
= exports.out $ new Pipeline

var bind $ \ (v k) (k v)

exports.in.for $ \ (action)
  var
    actionData $ Immutable.fromJS action.data
  exports.out.send $ {}
    :type action.type
    :stateId action.stateId
    :data $ case action.type
      :group/add
        ... schema.group
          set :id (shortid.generate)
          set :textTime (time.now)
      :item/add $ ... schema.item
        set :id (shortid.generate)
        set :groupId action.data.groupId
        set :textTime (time.now)
      :group/update
        actionData.set :textTime (time.now)
      :item/update
        actionData.set :textTime (time.now)
      else actionData
