
var
  React $ require :react
  Immutable $ require :immutable

var
  view $ require :../frontend/view
  time $ require :../util/time

var
  Checkbox $ React.createFactory $ require :./checkbox
  Item $ React.createFactory $ require :./item
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-group

  :propTypes $ {}
    :group $ React.PropTypes.instanceOf Immutable.Map

  :getInitialState $ \ ()
    {}
      :text $ this.props.group.get :text
      :textTime $ this.props.group.get :textTime

  :isGroupChecked $ \ ()
    return false

  :onItemAdd $ \ ()
    view.action $ {}
      :type :item/add
      :data $ {}
        :groupId $ this.props.group.get :id

  :onChange $ \ (event)
    this.setState $ {}
      :text event.target.value
      :textTime (time.now)
    view.action $ {}
      :type :group/update
      :data $ {}
        :groupId $ this.props.group.get :id
        :text event.target.value

  :renderText $ \ ()
    cond (> this.state.textTime (this.props.group.get :textTime))
      , this.state.text
      this.props.group.get :text

  :render $ \ ()
    var children $ this.props.group.get :children

    div ({} (:className ":app-group"))
      div ({} (:className ":group-display line"))
        Checkbox $ {} (:checked $ this.isGroupChecked)
        input $ {} (:className ":group-name")
          :value (this.renderText)
          :placeholder :Group
          :onChange this.onChange
      div ({} (:className :group-children))
        children.map $ \ (item)
          Item $ {} (:item item) (:key $ item.get :id)
        div ({} (:className :group-footer))
          div
            {} (:className ":button is-attract")
              :onClick this.onItemAdd
            , ":add item"
