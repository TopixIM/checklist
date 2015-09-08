
var
  React $ require :react
  classnames $ require :classnames

var
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :app-checkbox

  :propTypes $ {}
    :checked React.PropTypes.bool.isRequired

  :render $ \ ()
    var className $ classnames :app-checkbox $ {}
      :is-checked this.props.checked

    div ({} (:className className))
