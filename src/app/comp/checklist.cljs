
(ns app.comp.checklist
  (:require [respo.macros :refer [defcomp list-> action-> <> div input button span]]
            [respo.comp.space :refer [=<]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo-ui.core :as ui]
            [app.schema :as schema]
            [app.style :as style]))

(defcomp
 comp-task
 (task)
 (div {} (input {:style ui/input, :placeholder "Task"}) (div {} (<> "children"))))

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
   (->> (:checklist page) (sort-by first) (map (fn [[k task]] [k (comp-task task)]))))
  (div {} (button {:style ui/button, :on-click (action-> :task/append [])} (<> "Add")))))
