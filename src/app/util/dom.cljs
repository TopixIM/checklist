
(ns app.util.dom )

(defonce ctx (.getContext (.createElement js/document "canvas") "2d"))

(defn text-width [text font-size font-family]
  (set! (.-font ctx) (str font-size "px " font-family))
  (.-width (.measureText ctx text)))
