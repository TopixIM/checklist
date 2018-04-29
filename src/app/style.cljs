
(ns app.style (:require [hsl.core :refer [hsl]] [respo-ui.core :as ui]))

(def button
  (merge
   ui/button
   {:background-color :white,
    :border-radius "12px",
    :color (hsl 20 30 80),
    :border (str "1px solid " (hsl 20 30 80)),
    :line-height "24px",
    :font-size 12}))

(def link
  {:text-decoration :underline,
   :cursor :pointer,
   :color (hsl 240 80 80),
   :font-family ui/font-fancy})
