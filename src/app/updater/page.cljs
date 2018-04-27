
(ns app.updater.page (:require [app.schema :as schema]))

(defn create [db op-data sid op-id op-time]
  (assoc-in db [:pages op-id] (merge schema/page {:title op-data, :id op-id, :time op-time})))
