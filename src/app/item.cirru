
var
  React $ require :react
  Immutable $ require :immutable

var
  Checkbox $ React.createFactory $ require :./checkbox
  div $ React.createFactory :div
  input $ React.createFactory :input

= module.exports $ React.createClass $ {}
  :displayName :app-item

  :propTypes $ {}
    :item $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    div ({} (:className ":app-item line"))
      Checkbox $ {} (:checked $ this.props.item.get :done)
      input $ {} (:className ":item-name")
        :value $ this.props.item.get :text
        :placeholder :Item
