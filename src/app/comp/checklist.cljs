
(ns app.comp.checklist
  (:require [respo.macros :refer [defcomp list-> action-> cursor-> <> div input button span]]
            [respo.comp.space :refer [=<]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo-ui.core :as ui]
            [app.schema :as schema]
            [app.style :as style]))

(defcomp
 comp-task
 (states tree-path task page-id)
 (let [state (or (:data states) {:text "", :time 0})]
   (div
    {:style (merge ui/row {:margin-bottom 8})}
    (input
     {:style ui/input,
      :value (if (> (:time state) (:time task)) (:text state) (:text task)),
      :on-input (fn [e d! m!]
        (let [text (:value e), now (.now js/Date)]
          (m! (merge state {:text text, :time now}))
          (d! :task/update-text {:path tree-path, :page-id page-id, :text text, :time now}))),
      :placeholder "Task"})
    (=< 8 nil)
    (div
     {}
     (list->
      {}
      (->> (:details task)
           (map
            (fn [[k sub-task]]
              [k (cursor-> k comp-task states (conj tree-path k) sub-task page-id)]))))
     (button
      {:style style/button,
       :on-click (action-> :task/append {:page-id page-id, :path tree-path})}
      (<> "Add"))))))

(defcomp
 comp-checklist
 (states page)
 (div
  {:style (merge ui/flex {:padding "8px 16px"})}
  (div
   {:style {:font-family ui/font-fancy, :font-size 24, :font-weight 300}}
   (<> (:title page)))
  (list->
   {}
   (->> (:checklist page)
        (sort-by first)
        (map (fn [[k task]] [k (cursor-> k comp-task states [k] task (:id page))]))))
  (div
   {}
   (button
    {:style style/button, :on-click (action-> :task/append {:path [], :page-id (:id page)})}
    (<> "Add")))))
