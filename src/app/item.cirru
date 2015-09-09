
var
  React $ require :react
  Immutable $ require :immutable
  classnames $ require :classnames

var
  view $ require :../frontend/view
  time $ require :../util/time

var
  Checkbox $ React.createFactory $ require :./checkbox
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-item

  :propTypes $ {}
    :item $ React.PropTypes.instanceOf Immutable.Map

  :getInitialState $ \ ()
    {}
      :text $ this.props.item.get :text
      :textTime $ this.props.item.get :textTime

  :onChange $ \ (event)
    this.setState $ {}
      :text event.target.value
      :textTime (time.now)
    view.action $ {}
      :type :item/update
      :data $ {}
        :groupId (this.props.item.get :groupId)
        :itemId (this.props.item.get :id)
        :text event.target.value

  :onToggle $ \ ()
    view.action $ {}
      :type :item/toggle
      :data $ {}
        :groupId $ this.props.item.get :groupId
        :itemId $ this.props.item.get :id

  :onRemove $ \ ()
    view.action $ {}
      :type :item/remove
      :data $ {}
        :groupId $ this.props.item.get :groupId
        :itemId $ this.props.item.get :id

  :renderText $ \ ()
    cond (> this.state.textTime (this.props.item.get :textTime))
      , this.state.text
      this.props.item.get :text

  :render $ \ ()
    var
      isDone $ this.props.item.get :done
    var className $ classnames :app-item :line $ {}
      :is-checked isDone

    div ({} (:className className))
      Checkbox $ {} (:checked isDone) (:onClick this.onToggle)
      input $ {} (:className ":item-name")
        :value $ this.props.item.get :text
        :placeholder :Item
        :onChange this.onChange
      div
        {} (:className ":button is-danger") (:onClick this.onRemove)
        , :remove
