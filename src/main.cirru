
var
  store $ require :./frontend/store
  websocket $ require :./frontend/websocket
  view $ require :./frontend/view
  page $ require :./app/page
  Pipeline $ require :cumulo-pipeline

require :./app/page
require :origami-ui
require :../style/main.css

websocket.setup $ {}
  :port 4004
  :onopen $ \ ()
    var accountInfo $ JSON.parse $ or
      localStorage.getItem :immutable-chat-account
      , :{}
    if (? accountInfo.name) $ do
      view.action $ {}
        :type :account/login
        :data accountInfo
    return

websocket.out.forward store.in
view.out.forward websocket.in

store.out.for $ \ (data)
  page.in.send $ {}
    :target :store
    :data data

store.out.for $ \ (data)
  console.info $ data.toJS
