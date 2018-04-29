
(ns app.updater.task
  (:require [app.schema :as schema]
            [bisection-key.util :refer [key-append key-before key-after]]))

(defn append [db op-data sid op-id op-time]
  (let [page-id (:page-id op-data)
        data-path (concat
                   [:pages page-id :checklist]
                   (interleave (:path op-data) (repeat :details)))]
    (println "data path" data-path)
    (update-in
     db
     data-path
     (fn [checklist]
       (let [new-key (key-append checklist)]
         (assoc checklist new-key (merge schema/task {:time op-time})))))))

(defn update-text [db op-data sid op-id op-time]
  (let [tree-path (:path op-data)
        text (:text op-data)
        time (:time op-data)
        page-id (:page-id op-data)
        data-path (concat
                   [:pages page-id :checklist]
                   (interleave (butlast tree-path) (repeat :details))
                   [(last tree-path)])]
    (update-in db data-path (fn [task] (-> task (assoc :text text) (assoc :time time))))))
