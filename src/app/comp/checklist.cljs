
(ns app.comp.checklist
  (:require [respo.macros :refer [defcomp list-> action-> <> div input button span]]
            [respo.comp.space :refer [=<]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo-ui.core :as ui]
            [app.schema :as schema]
            [app.style :as style]))

(defcomp
 comp-task
 (tree-path task)
 (div
  {:style (merge ui/row {:margin-bottom 8})}
  (input {:style ui/input, :placeholder "Task"})
  (=< 8 nil)
  (div
   {}
   (list->
    {}
    (->> (:details task)
         (map (fn [[k sub-task]] [k (comp-task (conj tree-path k) sub-task)]))))
   (button {:style style/button, :on-click (action-> :task/append tree-path)} (<> "Add")))))

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
   (->> (:checklist page) (sort-by first) (map (fn [[k task]] [k (comp-task [k] task)]))))
  (div {} (button {:style style/button, :on-click (action-> :task/append [])} (<> "Add")))))
