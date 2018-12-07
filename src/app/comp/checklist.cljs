
(ns app.comp.checklist
  (:require [respo.core :refer [defcomp list-> action-> cursor-> <> div input button span]]
            [respo.comp.space :refer [=<]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo-ui.core :as ui]
            [app.schema :as schema]
            [app.style :as style]
            [app.util.dom :refer [text-width]]
            [hsl.core :refer [hsl]]
            [respo.util.list :refer [map-val]]))

(defcomp
 comp-task
 (states tree-path task page-id)
 (let [state (or (:data states) {:text "", :time 0})]
   (div
    {:style (merge ui/row {:margin-bottom 8})}
    (let [latest-text (if (> (:time state) (:time task)) (:text state) (:text task))]
      (input
       {:style (merge
                ui/input
                {:display :inline-block,
                 :min-width 64,
                 :width (let [width (text-width latest-text 14 ui/font-normal)]
                   (+ 20 width)),
                 :background-color (hsl 0 0 97)}),
        :value latest-text,
        :on-input (fn [e d! m!]
          (let [text (:value e), now (.now js/Date)]
            (m! (merge state {:text text, :time now}))
            (d!
             :task/update-text
             {:path tree-path, :page-id page-id, :text text, :time now}))),
        :placeholder "Task"}))
    (=< 8 nil)
    (span
     {:style (merge style/link {:color (hsl 0 90 60)}),
      :on-click (fn [e d! m!]
        (let [confirmation (js/confirm "Sure to delete?")]
          (if confirmation (d! :task/remove-one {:page-id page-id, :path tree-path}))))}
     (<> "Del"))
    (=< 8 nil)
    (div
     {}
     (list->
      {:style {:border-left (str "1px solid " (hsl 0 0 90)), :padding-left 8}}
      (->> (:details task)
           (map
            (fn [[k sub-task]]
              [k (cursor-> k comp-task states (conj tree-path k) sub-task page-id)]))))
     (span
      {:style style/link,
       :on-click (action-> :task/append {:page-id page-id, :path tree-path})}
      (<> "Add"))))))

(defcomp
 comp-checklist
 (states page)
 (let [page-data (:data page)]
   (div
    {:style (merge
             ui/flex
             {:padding "8px 16px", :overflow :auto, :padding-top 80, :padding-bottom 240})}
    (div
     {:style nil}
     (<> (:title page-data) {:font-weight 300, :font-size 23, :font-family ui/font-fancy})
     (=< 8 nil)
     (list->
      {:style (merge ui/row {:display :inline-flex})}
      (->> (:members page)
           (map-val (fn [username] (<> username {:margin-right 8, :font-size 14}))))))
    (list->
     {}
     (->> (:checklist page-data)
          (sort-by first)
          (map (fn [[k task]] [k (cursor-> k comp-task states [k] task (:id page-data))]))))
    (div
     {}
     (button
      {:style style/button,
       :on-click (action-> :task/append {:path [], :page-id (:id page-data)})}
      (<> "Add"))))))
