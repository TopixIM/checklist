
(ns app.schema )

(def configs {:storage-key "checklist", :port 11005})

(def database {:sessions {}, :users {}, :pages {}})

(def dev? (do ^boolean js/goog.DEBUG))

(def notification {:id nil, :kind nil, :text nil})

(def page {:title "", :id nil, :checklist {}, :time nil})

(def router {:name nil, :title nil, :data {}, :router nil})

(def session
  {:user-id nil,
   :id nil,
   :nickname nil,
   :router {:name :home, :data nil, :router nil},
   :notifications []})

(def task {:text "", :done? false, :details {}, :folded? false, :time nil})

(def user {:name nil, :id nil, :nickname nil, :avatar nil, :password nil})
