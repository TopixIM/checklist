
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view

var
  Checkbox $ React.createFactory $ require :./checkbox
  Item $ React.createFactory $ require :./item
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-group

  :propTypes $ {}
    :group $ React.PropTypes.instanceOf Immutable.Map

  :isGroupChecked $ \ ()
    return false

  :onItemAdd $ \ ()
    view.action $ {}
      :type :item/add
      :data $ {}
        :groupId $ this.props.group.get :id

  :render $ \ ()
    var children $ this.props.group.get :children

    div ({} (:className ":app-group"))
      div ({} (:className ":group-display line"))
        Checkbox $ {} (:checked $ this.isGroupChecked)
        input $ {} (:className ":group-name")
          :value $ this.props.group.get :text
          :placeholder :Group
      div ({} (:className :group-children))
        children.map $ \ (item)
          Item $ {} (:item item) (:key $ item.get :id)
        div ({} (:className :group-footer))
          div
            {} (:className ":button is-attract")
              :onClick this.onItemAdd
            , ":add item"
