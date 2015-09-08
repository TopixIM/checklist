
var
  React $ require :react
  Pipeline $ require :cumulo-pipeline
  schema $ require :../backend/schema
  view $ require :../frontend/view

= exports.in $ new Pipeline

var
  div $ React.createFactory :div

var pageComponent $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    return $ {}
      :store schema.store

  :componentWillMount $ \ ()
    exports.in.for $ \\ (data)
      if (is data.target :store) $ do
        this.setState $ {} $ :store data.data
      return

  :onNotisClick $ \ (id)
    view.action $ {} (:type :state/check) (:data id)

  :render $ \ ()
    div ({}) :app-page

var
  Page $ React.createFactory pageComponent

React.render (Page) document.body
