
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view
var
  Group $ React.createFactory $ require :./group
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :app-table

  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :onGroupAdd $ \ ()
    console.log :clicked
    view.action $ {}
      :type :group/add

  :render $ \ ()
    var groups $ this.props.store.get :groups

    div ({} (:className :app-table))
      groups.map $ \ (group)
        Group $ {} (:group group) (:key $ group.get :id)
      div ({} (:className ":line table-footer"))
        div
          {} (:className ":button is-attract")
            :onClick this.onGroupAdd
          , ":add group"
