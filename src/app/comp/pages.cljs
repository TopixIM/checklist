
(ns app.comp.pages
  (:require [respo.macros :refer [defcomp list-> <> div input button span]]
            [respo.comp.space :refer [=<]]
            [respo.comp.inspect :refer [comp-inspect]]
            [respo-ui.core :as ui]
            [app.schema :as schema]
            [app.style :as style]
            [respo.util.list :refer [map-val]]
            [clojure.string :as string]
            [hsl.core :refer [hsl]]))

(defcomp
 comp-pages
 (pages)
 (div
  {:style {:padding 16}}
  (div {:style {:font-family ui/font-fancy, :font-size 24, :font-weight 300}} (<> "Pages"))
  (list->
   {:style (merge ui/row {:flex-wrap :wrap})}
   (->> pages
        (map-val
         (fn [page]
           (div
            {:style {:background-color (hsl 0 0 98),
                     :color (hsl 0 0 40),
                     :width 240,
                     :height 64,
                     :margin-right 16,
                     :margin-bottom 16,
                     :padding 8,
                     :border (str "1px solid " (hsl 0 0 90)),
                     :cursor :pointer},
             :on-click (fn [e d! m!] (d! :router/change {:name :page, :data (:id page)}))}
            (<> (:title page)))))))
  (div
   {}
   (button
    {:style ui/button,
     :on-click (fn [e d! m!]
       (let [page-name (js/prompt "Add page name")]
         (if (not (string/blank? page-name)) (d! :page/create page-name))))}
    (<> "Add page")))))
