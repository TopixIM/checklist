
var
  schema $ require :../schema

= exports.connect $ \ (db action)
  ... db
    setIn ([] :states action.stateId)
      schema.state.set :id action.stateId

= exports.disconnect $ \ (db action)
  var
    theState $ db.getIn ([] :states action.stateId)
  ... db
    deleteIn $ [] :states action.stateId
