
var
  React $ require :react
  Immutable $ require :immutable

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

  :renderText $ \ ()
    cond (> this.state.textTime (this.props.item.get :textTime))
      , this.state.text
      this.props.item.get :text

  :render $ \ ()
    div ({} (:className ":app-item line"))
      Checkbox $ {} (:checked $ this.props.item.get :done)
      input $ {} (:className ":item-name")
        :value $ this.props.item.get :text
        :placeholder :Item
        :onChange this.onChange

